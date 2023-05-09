import 'package:audread/utils/components/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AudTextInput extends FormValidator {
  Widget emailInput([controller]) {
    return TextFormField(
      controller: controller,
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

  Widget passwordInput(obecurePassword, toggle, [controller]) {
    return TextFormField(
      controller: controller,
      validator: (value) => validatePassword(value),
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.urbanist(fontSize: 21),
      obscureText: obecurePassword,
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
        suffixIcon: IconButton(
          onPressed: toggle,
          icon: Icon(
            obecurePassword ? Iconsax.eye : Iconsax.eye_slash,
            color: Colors.black,
          ),
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

  Widget textInput([name, controller]) {
    return TextFormField(
      controller: controller,
      validator: (value) => validateName(value),
      style: GoogleFonts.urbanist(fontSize: 21),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: Colors.blue.shade50,
        focusColor: Colors.black,
        labelText: name[0],
        labelStyle: GoogleFonts.urbanist(
          fontSize: 21,
          color: Colors.black,
        ),
        hintText: name[1],
        hintStyle: GoogleFonts.urbanist(fontSize: 16),
        prefixIcon: Icon(
          name[2],
          color: Colors.black,
        ),
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

  Widget detailsInput(context, [iniValue, controller]) {
    return TextFormField(
      initialValue: iniValue,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.none,
            width: 0,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        contentPadding: const EdgeInsets.all(0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.none,
            width: 0,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
      style: GoogleFonts.urbanist(
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
