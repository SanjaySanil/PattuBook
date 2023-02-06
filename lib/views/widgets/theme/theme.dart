import 'package:flutter/material.dart';
import 'package:shopzy/views/widgets/theme/text_theme/text_theme.dart';

class TTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme:AppBarTheme(backgroundColor:Color(0xff00726D)),
      textButtonTheme: TTextButtonTheme.textButtonLightThemeData,
      brightness: Brightness.light,
      textTheme: TTextTheme.textThemeLight,
      elevatedButtonTheme: TElevatedButtonStyle.elevatedButtonLightTheme);
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TTextTheme.textThemeDark,
      elevatedButtonTheme: TElevatedButtonStyle.elevatedButtonDarkTheme);
}

class TElevatedButtonStyle {
  static ElevatedButtonThemeData elevatedButtonLightTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const StadiumBorder(),
              backgroundColor: Colors.orange));
  static ElevatedButtonThemeData elevatedButtonDarkTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const StadiumBorder(),
              backgroundColor: Colors.orange));
}



class TTextButtonTheme {
  static TextButtonThemeData textButtonLightThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle:const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}
