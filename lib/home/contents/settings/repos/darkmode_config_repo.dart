import 'package:shared_preferences/shared_preferences.dart';

class DarkModeConfigRepository {
  static const String _darkmode = "darkmode";

  SharedPreferences _preferences;

  DarkModeConfigRepository(this._preferences);

  Future<void> enableDarkMode(bool value) async {
    _preferences.setBool(_darkmode, value);
  }

  bool isDarkMode() {
    return _preferences.getBool(_darkmode) ?? false;
  }
}
