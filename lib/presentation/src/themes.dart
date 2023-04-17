import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/presentation/src/colors.dart';
import 'package:news/presentation/src/values.dart';

final myTheme = ThemeData(
  primarySwatch: ColorManager.materialBlue,
  appBarTheme: appbarLightTheme,
  scaffoldBackgroundColor: ColorManager.white,
  canvasColor: ColorManager.white,
  splashColor: ColorManager.black,
  cardColor: ColorManager.black,
  bottomNavigationBarTheme: bottomNavigationBarLightTheme,
);

final darkTheme = ThemeData(
  primarySwatch: ColorManager.materialBlue,
  appBarTheme: appbarDarkTheme,
  scaffoldBackgroundColor: ColorManager.black12,
  canvasColor: ColorManager.black26,
  splashColor: ColorManager.white,
  cardColor: ColorManager.black,
  bottomNavigationBarTheme: bottomNavigationBarDarkTheme,
);

const bottomNavigationBarLightTheme = BottomNavigationBarThemeData(
  type: BottomNavigationBarType.shifting,
  elevation: AppSizes.s10,
  showSelectedLabels: true,
  showUnselectedLabels: true,
  backgroundColor: ColorManager.white70,
  unselectedItemColor: ColorManager.grey,
  selectedItemColor: ColorManager.blue,
);
const bottomNavigationBarDarkTheme = BottomNavigationBarThemeData(
  type: BottomNavigationBarType.shifting,
  elevation: AppSizes.s10,
  showSelectedLabels: true,
  showUnselectedLabels: true,
  backgroundColor: ColorManager.white70,
  unselectedItemColor: ColorManager.grey,
  selectedItemColor: ColorManager.blue,
);

const appbarLightTheme = AppBarTheme(
  backgroundColor: ColorManager.white,
  elevation: AppSizes.s5,
  foregroundColor: ColorManager.black,
  titleTextStyle: TextStyle(color: ColorManager.black),
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: ColorManager.white,
    statusBarIconBrightness: Brightness.dark,
  ),
);

const appbarDarkTheme = AppBarTheme(
  backgroundColor: ColorManager.black,
  elevation: AppSizes.s5,
  foregroundColor: ColorManager.white,
  titleTextStyle: TextStyle(color: ColorManager.white),
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: ColorManager.black,
    statusBarIconBrightness: Brightness.light,
  ),
);
