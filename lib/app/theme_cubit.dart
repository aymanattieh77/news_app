import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/app/app_prefs.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(super.initialState, this._appPreferences);
  final AppPreferences _appPreferences;

  void changeThemeMode() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
      _appPreferences.setThemeMode(true);
    } else {
      emit(ThemeMode.light);
      _appPreferences.setThemeMode(false);
    }
  }
}
