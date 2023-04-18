import 'package:news/app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  Future<void> setThemeMode(bool isDark) async {
    _sharedPreferences.setBool(AppConstants.isDarkKey, isDark);
  }

  bool isDarkMode() {
    return _sharedPreferences.getBool(AppConstants.isDarkKey) ?? false;
  }
}
