import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

/// Holds the selected [ThemeMode] and persists it across app launches.
class ThemeController extends ChangeNotifier {
  ThemeController._(this._box, this._mode);

  // Names kept from earlier versions so the stored choice is still found.
  static const _boxName = 'themeBox';
  static const _modeKey = 'theme';

  static Future<ThemeController> load() async {
    final box = await Hive.openBox<String>(_boxName);
    final mode = ThemeMode.values.asNameMap()[box.get(_modeKey)];
    return ThemeController._(box, mode ?? ThemeMode.system);
  }

  final Box<String> _box;
  ThemeMode _mode;

  ThemeMode get mode => _mode;

  Future<void> setMode(ThemeMode mode) async {
    if (mode == _mode) return;
    _mode = mode;
    notifyListeners();
    await _box.put(_modeKey, mode.name);
  }
}
