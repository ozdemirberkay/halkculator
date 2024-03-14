import 'package:flutter/material.dart';
import 'package:halkculator/config/constants/database_configs.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.system;
  ThemeProvider({required this.currentTheme});

  Future<void> setTheme({required ThemeMode newTheme}) async {
    currentTheme = newTheme;
    notifyListeners();
  }
}

class ThemeManager {
  static ThemeProvider watchTheme({required BuildContext context}) {
    return context.watch<ThemeProvider>();
  }

  static Future<void> setTheme({
    required BuildContext context,
    required ThemeMode newTheme,
  }) async {
    Provider.of<ThemeProvider>(context, listen: false)
        .setTheme(newTheme: newTheme);
    saveTheme(newTheme);
  }

  static Future<void> saveTheme(ThemeMode newTheme) async {
    var box = await Hive.openBox(DatabaseConfigs.themeBoxName);
    box.put(DatabaseConfigs.themeKeyName, _themeModeToString(newTheme));
  }

  static Future<ThemeMode> readTheme() async {
    var box = await Hive.openBox(DatabaseConfigs.themeBoxName);
    var theme = box.get(DatabaseConfigs.themeKeyName);
    return _stringToThemeMode(theme);
  }

  static String _themeModeToString(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return 'system';
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system';
    }
  }

  static ThemeMode _stringToThemeMode(dynamic value) {
    switch (value) {
      case 'system':
        return ThemeMode.system;
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
