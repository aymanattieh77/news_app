import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final myTheme = ThemeData(
  primarySwatch: Colors.blue,
  appBarTheme: appbarLightTheme,
  scaffoldBackgroundColor: Colors.white,
  canvasColor: Colors.white,
  splashColor: Colors.black87,
  cardColor: Colors.white,
  bottomNavigationBarTheme: bottomNavigationBarLightTheme,
);

final darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  appBarTheme: appbarDarkTheme,
  scaffoldBackgroundColor: Colors.black12,
  canvasColor: Colors.black26,
  splashColor: Colors.white,
  cardColor: Colors.black87,
  bottomNavigationBarTheme: bottomNavigationBarDarkTheme,
);

const bottomNavigationBarLightTheme = BottomNavigationBarThemeData(
  type: BottomNavigationBarType.shifting,
  elevation: 10,
  showSelectedLabels: true,
  showUnselectedLabels: true,
  backgroundColor: Colors.white70,
  unselectedItemColor: Colors.grey,
  selectedItemColor: Colors.blue,
);
const bottomNavigationBarDarkTheme = BottomNavigationBarThemeData(
  type: BottomNavigationBarType.shifting,
  elevation: 10,
  showSelectedLabels: true,
  showUnselectedLabels: true,
  backgroundColor: Colors.white70,
  unselectedItemColor: Colors.grey,
  selectedItemColor: Colors.blue,
);

const appbarLightTheme = AppBarTheme(
  backgroundColor: Colors.white,
  elevation: 5.0,
  foregroundColor: Colors.black,
  titleTextStyle: TextStyle(color: Colors.black),
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ),
);

const appbarDarkTheme = AppBarTheme(
  backgroundColor: Colors.black,
  elevation: 5.0,
  foregroundColor: Colors.white,
  titleTextStyle: TextStyle(color: Colors.white),
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light,
  ),
);
