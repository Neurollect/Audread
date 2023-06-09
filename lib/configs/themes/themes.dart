import 'package:audread/configs/themes/button_theme.dart';
import 'package:audread/configs/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppAudTheme {
  AppAudTheme._();

  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.light,
    textTheme: TextAudTheme.lightTheme,
    appBarTheme: const AppBarTheme(),
    elevatedButtonTheme: ElevatedButtonAudTheme.lightTheme,
    outlinedButtonTheme: OutlinedButtonAudTheme.lightTheme,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.dark,
    textTheme: TextAudTheme.darkTheme,
    appBarTheme: const AppBarTheme(),
    elevatedButtonTheme: ElevatedButtonAudTheme.darkTheme,
    outlinedButtonTheme: OutlinedButtonAudTheme.darkTheme,
  );
}
