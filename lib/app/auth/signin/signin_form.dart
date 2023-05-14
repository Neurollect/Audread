import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/auth_controlllers/signin_controller.dart';
import '../../../utils/utils.dart';
import '../forget_password/forgot_password.dart';
import '../signup/signup.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  SigninFormState createState() => SigninFormState();
}

class SigninFormState extends State<SigninForm> {
  final utils = Utils();
  final controller = Get.put(SigninController());

  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool checked = false;
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
          RichText(
            text: TextSpan(
              text: 'Forgot Password? ',
              style: GoogleFonts.urbanist(
                fontSize: 17,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Reset it',
                  style: GoogleFonts.urbanist(
                    fontSize: 17,
                    color: Colors.blue.shade800,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(
                        const ForgotPassword(),
                      );
                    },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          utils.buttons.authButton(
            'Sign In',
            () => controller.signin(context),
            context,
          ),
          const SizedBox(height: 22),
          utils.buttons.googleAuthButton('Signin with Google', context),
          const SizedBox(height: 30),
          RichText(
            text: TextSpan(
              text: 'Do not Have an Account? ',
              style: GoogleFonts.urbanist(
                fontSize: 17,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Create Account',
                  style: GoogleFonts.urbanist(
                    fontSize: 17,
                    color: Colors.blue.shade800,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(
                        const SignUpScreen(),
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
