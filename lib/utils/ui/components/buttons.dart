import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AudButtons {
  static Widget backButton = TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      backgroundColor: const Color.fromARGB(31, 0, 145, 255),
      shape: const CircleBorder(),
      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
    ),
    child: const Icon(
      Iconsax.arrow_left,
      size: 30,
    ),
  );
}
