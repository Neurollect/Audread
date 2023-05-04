import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/utils.dart';
import '../signin/signin.dart';
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
                child: RichText(
                  text: TextSpan(
                    text: 'I agree with the',
                    style: GoogleFonts.urbanist(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Terms and Conditions',
                        style: GoogleFonts.urbanist(
                          fontSize: 17,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      TextSpan(
                        text: ' and',
                        style: GoogleFonts.urbanist(fontSize: 17),
                      ),
                      TextSpan(
                        text: ' Privacy Policy',
                        style: GoogleFonts.urbanist(
                          fontSize: 17,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          utils.buttons.authButton(
            'Create Account',
            () => controller.signup(context, checked),
            context,
          ),
          const SizedBox(height: 22),
          utils.buttons.googleAuthButton('Signup with Google', context),
          const SizedBox(height: 30),
          RichText(
            text: TextSpan(
              text: 'Already Have an Account? ',
              style: GoogleFonts.urbanist(
                fontSize: 17,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Sign In',
                  style: GoogleFonts.urbanist(
                    fontSize: 17,
                    color: Colors.blue.shade800,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(
                        const SignInScreen(),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
