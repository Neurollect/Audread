import 'package:audread/app/auth/forget_password/forgot_password.dart';
import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/signin_controller.dart';

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
          Row(
            children: [
              Expanded(
                child: Text(
                  'Did you forget your Password?',
                  style: GoogleFonts.urbanist(
                    fontSize: 17,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(const ForgotPassword());
                },
                child: Text(
                  ' Click Here',
                  style: GoogleFonts.urbanist(
                    fontSize: 17,
                    color: Colors.blue.shade800,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          utils.buttons.authButton(
            'Sign In',
            controller.signin,
            context,
          ),
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
