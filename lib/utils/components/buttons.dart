import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AudButtons {
  Widget backButton() {
    return TextButton(
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

  Widget authButton(text, function, context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: function,
        style: Theme.of(context).elevatedButtonTheme.style,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget googleAuthButton(text, context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: Theme.of(context).outlinedButtonTheme.style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.g_mobiledata),
            const SizedBox(width: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
