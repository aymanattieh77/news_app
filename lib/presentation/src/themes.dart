import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/presentation/src/resources.dart';

final myTheme = ThemeData(
  primarySwatch: ColorManager.materialBlue,
  appBarTheme: appbarLightTheme,
  scaffoldBackgroundColor: ColorManager.white,
  canvasColor: ColorManager.white,
  hintColor: ColorManager.grey,
  textTheme: _lightTextTheme(),
  cardColor: ColorManager.white,
  bottomNavigationBarTheme: bottomNavigationBarLightTheme,
);

TextTheme _lightTextTheme() {
  return const TextTheme(
    bodySmall: TextStyle(color: ColorManager.black, fontSize: FontSizes.f14),
    displaySmall: TextStyle(color: ColorManager.black, fontSize: FontSizes.f10),
    bodyMedium: TextStyle(color: ColorManager.black, fontSize: FontSizes.f20),
    displayMedium:
        TextStyle(color: ColorManager.black, fontSize: FontSizes.f16),
    bodyLarge: TextStyle(
      color: ColorManager.black,
      fontSize: FontSizes.f20,
      fontWeight: FontWeight.bold,
    ),
  );
}

final darkTheme = ThemeData(
  primarySwatch: ColorManager.materialBlue,
  appBarTheme: appbarDarkTheme,
  scaffoldBackgroundColor: ColorManager.black12,
  canvasColor: ColorManager.black26,
  cardColor: ColorManager.black,
  hintColor: ColorManager.grey,
  textTheme: _darkTextTheme(),
  bottomNavigationBarTheme: bottomNavigationBarDarkTheme,
);

TextTheme _darkTextTheme() {
  return const TextTheme(
    bodySmall: TextStyle(color: ColorManager.white, fontSize: FontSizes.f14),
    displaySmall: TextStyle(color: ColorManager.white, fontSize: FontSizes.f10),
    displayMedium:
        TextStyle(color: ColorManager.white, fontSize: FontSizes.f16),
    bodyMedium: TextStyle(color: ColorManager.white, fontSize: FontSizes.f20),
    bodyLarge: TextStyle(
        color: ColorManager.white,
        fontSize: FontSizes.f20,
        fontWeight: FontWeight.bold),
  );
}

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
