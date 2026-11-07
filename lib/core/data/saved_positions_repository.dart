import 'package:flutter/foundation.dart';
import 'package:halkculator/core/data/stock_position.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

typedef SavedPosition = ({Object key, StockPosition position});

/// Persists the positions the user saved from the calculator.
class SavedPositionsRepository {
  SavedPositionsRepository._(this._box);

  // Box name kept from earlier versions so existing data is still found.
  static const _boxName = 'shareBox';

  static Future<SavedPositionsRepository> open() async {
    final box = await Hive.openBox<StockPosition>(_boxName);
    await _migrateLegacyKeys(box);
    return SavedPositionsRepository._(box);
  }

  /// Earlier versions stored entries under random UUID keys, which gave them
  /// no meaningful order. Re-insert them with auto-increment keys so that the
  /// key order matches insertion order from now on.
  static Future<void> _migrateLegacyKeys(Box<StockPosition> box) async {
    final legacyKeys = box.keys.whereType<String>().toList();
    if (legacyKeys.isEmpty) return;

    await box.addAll([for (final key in legacyKeys) box.get(key)!]);
    await box.deleteAll(legacyKeys);
  }

  final Box<StockPosition> _box;

  /// Notifies whenever the saved positions change.
  ValueListenable<Box<StockPosition>> get changes => _box.listenable();

  bool get isEmpty => _box.isEmpty;

  /// All saved positions, most recently saved first.
  List<SavedPosition> newestFirst() => [
    for (final key in _box.keys.toList().reversed)
      (key: key as Object, position: _box.get(key)!),
  ];

  Future<void> add(StockPosition position) => _box.add(position);

  Future<void> delete(Object key) => _box.delete(key);

  Future<void> clear() => _box.clear();
}
