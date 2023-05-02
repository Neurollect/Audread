import 'package:audread/configs/components/text_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  SignupFormState createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  final inputs = AudTextInput();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Email',
            style: GoogleFonts.urbanist(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            style: GoogleFonts.urbanist(fontSize: 21),
            keyboardType: TextInputType.emailAddress,
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
          ),
          const SizedBox(height: 30),
          Text(
            'Password',
            style: GoogleFonts.urbanist(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
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
          )
        ],
      ),
    );
  }
}
