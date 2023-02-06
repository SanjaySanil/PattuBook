import 'package:flutter/material.dart';

class TTextTheme {
  static TextTheme textThemeLight = const TextTheme(
    headlineLarge: TextStyle(),
    headlineMedium: TextStyle(
        color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontSize: 20, color: Colors.black),
    bodyLarge: TextStyle(),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    bodySmall: TextStyle(),
    titleLarge: TextStyle(),
    titleMedium: TextStyle(),
    titleSmall: TextStyle(color: Colors.black, fontSize: 20),
  );
  static TextTheme textThemeDark = const TextTheme(
    headlineLarge: TextStyle(),
    headlineMedium: TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(),
    bodyLarge: TextStyle(),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
    titleLarge: TextStyle(),
    titleMedium: TextStyle(),
    titleSmall: TextStyle(color: Colors.white, fontSize: 20),
  );
}
