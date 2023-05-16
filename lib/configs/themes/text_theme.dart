import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colors = Utils().globalColors;

class TextAudTheme {
  static TextTheme lightTheme = TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Blanka',
      fontSize: 42,
      color: colors.primary,
    ),
    titleMedium: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 40),
    labelLarge: GoogleFonts.urbanist(fontSize: 23, fontWeight: FontWeight.bold),
    labelMedium: GoogleFonts.urbanist(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
  );

  static TextTheme darkTheme = TextTheme(
    titleLarge: const TextStyle(fontFamily: 'Blanka', fontSize: 36),
    titleMedium: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 40),
    labelLarge: GoogleFonts.urbanist(fontSize: 23, fontWeight: FontWeight.bold),
    labelMedium: GoogleFonts.urbanist(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
  );
}
