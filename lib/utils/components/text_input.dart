import 'package:audread/utils/components/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AudTextInput extends FormValidator {
  Widget emailInput([controller]) {
    return TextFormField(
      validator: (value) => validateEmail(value),
      style: GoogleFonts.urbanist(fontSize: 21),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: Colors.blue.shade50,
        focusColor: Colors.black,
        prefixIcon: const Icon(
          Iconsax.user,
          color: Colors.black,
        ),
        labelText: 'Email',
        labelStyle: GoogleFonts.urbanist(
          fontSize: 21,
          color: Colors.black,
        ),
        hintText: 'email@email.com',
        hintStyle: GoogleFonts.urbanist(fontSize: 16),
        border: OutlineInputBorder(
          gapPadding: 2,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget passwordInput([controller]) {
    return TextFormField(
      validator: (value) => validatePassword(value),
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.urbanist(fontSize: 21),
      obscureText: true,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: Colors.blue.shade50,
        focusColor: Colors.black,
        labelText: 'Password',
        labelStyle: GoogleFonts.urbanist(
          fontSize: 21,
          color: Colors.black,
        ),
        prefixIcon: const Icon(
          Iconsax.password_check,
          color: Colors.black,
        ),
        hintText: '********',
        hintStyle: GoogleFonts.urbanist(fontSize: 16),
        border: OutlineInputBorder(
          gapPadding: 2,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
    );
  }
}
