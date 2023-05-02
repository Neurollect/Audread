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
  Widget emailInput([controller]) {
    return TextFormField(
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
      style: GoogleFonts.urbanist(fontSize: 21),
      keyboardType: TextInputType.emailAddress,
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
