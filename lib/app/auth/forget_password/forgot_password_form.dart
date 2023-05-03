import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/forgot_password_controller.dart';
import '../../../utils/utils.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({Key? key}) : super(key: key);

  @override
  ForgetPasswordFormState createState() => ForgetPasswordFormState();
}

class ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final utils = Utils();
  final controller = Get.put(ForgetPasswordController());

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
          Row(
            children: [
              Expanded(
                child: Text(
                  'Input your email here above to recieve a Reset code.',
                  style: GoogleFonts.urbanist(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          utils.buttons.authButton(
            'Send Reset Code',
            controller.sendResetCode,
            context,
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }
}
