import 'package:audread/utils/utils.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

final colors = Utils().globalColors;

class CardLoadingAudTheme {
  static CardLoadingTheme lightTheme = const CardLoadingTheme(
    colorOne: Color.fromARGB(255, 240, 240, 240),
    colorTwo: Color.fromARGB(255, 236, 235, 235),
  );

  static CardLoadingTheme darkTheme = const CardLoadingTheme(
    colorOne: Color.fromARGB(255, 94, 92, 92),
    colorTwo: Color.fromARGB(255, 89, 87, 87),
  );
}
