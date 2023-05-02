import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  SigninFormState createState() => SigninFormState();
}

class SigninFormState extends State<SigninForm> {
  bool checked = false;
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
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Checkbox(
                value: checked,
                onChanged: (value) {
                  setState(() {
                    checked = true;
                  });
                },
              ),
              Expanded(
                child: Text(
                  'I agree with the Terms and Conditions and Privacy Policy',
                  style: GoogleFonts.urbanist(
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (() {}),
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text(
                'Create Account',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: (() {}),
              style: Theme.of(context).outlinedButtonTheme.style,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.g_mobiledata),
                  const SizedBox(width: 10),
                  Text(
                    'Signup with Google',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Already Have an Account?',
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
