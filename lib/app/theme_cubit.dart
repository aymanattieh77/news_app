import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(super.initialState);

  Future<void> setThemeMode(bool isDark) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isDark', isDark);
  }

  void changeThemeMode() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
      setThemeMode(true);
    } else {
      emit(ThemeMode.light);
      setThemeMode(false);
    }
  }
}
