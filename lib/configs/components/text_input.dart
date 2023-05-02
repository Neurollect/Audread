import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class InputType {
  Key? key;
  TextEditingController? controller;
  Function? function;

  InputType({this.controller, this.function, this.key});
}

class AudTextInput {
  static InputType pwdInput = InputType(function: ([controller]) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.urbanist(fontSize: 21),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: Colors.blue.shade100,
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
  });

  static TextFormField Function(dynamic controller) emailInput = (controller) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.urbanist(fontSize: 21),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: Colors.blue.shade100,
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
  };

  static TextFormField Function(TextEditingController controller)
      passwordInput = (controller) {
    return TextFormField(
      style: GoogleFonts.urbanist(fontSize: 21),
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: Colors.blue.shade100,
        focusColor: Colors.black,
        labelText: '********',
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
          ),
        ),
      ),
    );
  };
}
