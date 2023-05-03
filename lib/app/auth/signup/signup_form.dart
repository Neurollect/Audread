import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/signup_controller.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  SignupFormState createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  final utils = Utils();
  final controller = Get.put(SignupController());

  bool checked = false;

  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
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
          utils.inputFields.emailInput(controller.email),
          const SizedBox(height: 30),
          Text(
            'Password',
            style: GoogleFonts.urbanist(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          utils.inputFields.passwordInput(
            _obscureText,
            _toggle,
            controller.password,
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
          utils.buttons.authButton(
            'Create Account',
            controller.signup,
            context,
          ),
          const SizedBox(height: 22),
          utils.buttons.googleAuthButton('Signup with Google', context),
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
