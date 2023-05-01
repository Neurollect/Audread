import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colors = Utils().globalColors;

class TextAudTheme {
  static TextTheme lightTheme = TextTheme(
      //Splash Text
      titleLarge:
          TextStyle(fontFamily: 'Blanka', fontSize: 42, color: colors.primary),

      //Title
      //Welcome Screen Page
      titleMedium:
          GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 40));

  static TextTheme darkTheme = TextTheme(
      //Splash Text
      titleLarge: const TextStyle(fontFamily: 'Blanka', fontSize: 36),

      //Title
      //Welcome Screen Page
      titleMedium:
          GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 40));
}
