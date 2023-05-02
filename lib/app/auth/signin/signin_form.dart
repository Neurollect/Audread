import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  SigninFormState createState() => SigninFormState();
}

class SigninFormState extends State<SigninForm> {
  final utils = Utils();
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
          utils.inputFields.emailInput(),
          const SizedBox(height: 30),
          Text(
            'Password',
            style: GoogleFonts.urbanist(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          utils.inputFields.passwordInput(),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Did you forget your Password?',
                  style: GoogleFonts.urbanist(
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          utils.buttons.authButton('Sign In', context),
          const SizedBox(height: 22),
          utils.buttons.googleAuthButton('Signin with Google', context),
          const SizedBox(height: 30),
          Text(
            'Do not Have an Account?',
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
