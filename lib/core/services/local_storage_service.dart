import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);

  static const String _themeKey = 'app_theme_mode';

  /// Save theme mode (true for dark, false for light)
  Future<void> saveThemeMode(bool isDarkMode) async {
    await _prefs.setBool(_themeKey, isDarkMode);
  }

  /// Get theme mode (defaults to false / light mode)
  bool getThemeMode() {
    return _prefs.getBool(_themeKey) ?? false;
  }

  /// Clear all shared preferences
  Future<void> clear() async {
    await _prefs.clear();
  }
}
