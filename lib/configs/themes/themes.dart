import 'package:audread/configs/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppAudTheme {
  AppAudTheme._();

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.cyan,
    brightness: Brightness.light,
    textTheme: TextAudTheme.lightTheme,
    appBarTheme: const AppBarTheme(),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    textTheme: TextAudTheme.darkTheme,
    appBarTheme: const AppBarTheme(),
  );
}
