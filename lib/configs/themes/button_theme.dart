import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';

final colors = Utils().globalColors;

class ElevatedButtonAudTheme {
  static ElevatedButtonThemeData lightTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      side: BorderSide(color: Colors.blue.shade800, width: 2),
      shadowColor: Colors.blue.shade500,
      backgroundColor: Colors.blue.shade800,
      foregroundColor: Colors.white,
    ),
  );
  static ElevatedButtonThemeData darkTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      side: BorderSide(color: Colors.blue.shade800, width: 2),
      shadowColor: Colors.blue.shade500,
      backgroundColor: Colors.blue.shade800,
      foregroundColor: Colors.white,
    ),
  );
}

class OutlinedButtonAudTheme {
  static OutlinedButtonThemeData lightTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shadowColor: Colors.blue.shade500,
      elevation: 2,
      side: BorderSide(color: Colors.blue.shade800, width: 2),
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      foregroundColor: Colors.blue.shade800,
      backgroundColor: Colors.white,
    ),
  );
  static OutlinedButtonThemeData darkTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shadowColor: Colors.blue.shade500,
      elevation: 2,
      side: BorderSide(color: Colors.blue.shade800, width: 2),
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      foregroundColor: Colors.blue.shade800,
      backgroundColor: Colors.white,
    ),
  );
}

/*
Elevated Button,
Outlined Button

*/