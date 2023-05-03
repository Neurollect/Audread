import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../controllers/code_verification_controller.dart';
import '../../../utils/utils.dart';

class CodeVerificationForm extends StatefulWidget {
  const CodeVerificationForm({Key? key}) : super(key: key);

  @override
  CodeVerificationFormState createState() => CodeVerificationFormState();
}

class CodeVerificationFormState extends State<CodeVerificationForm> {
  final utils = Utils();
  final controller = Get.put(CodeVerificationController());

  bool checked = false;
  String otpCode = '';

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
          OtpTextField(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            fieldWidth: (MediaQuery.of(context).size.width / 8),
            clearText: true,
            margin: EdgeInsets.only(
              right: (MediaQuery.of(context).size.width / 41),
            ),
            textStyle: GoogleFonts.urbanist(
              fontSize: 30,
              color: Colors.black,
            ),
            keyboardType: TextInputType.text,
            numberOfFields: 6,
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
            onSubmit: (code) => setState(
              () {
                otpCode = code;
              },
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Input Reset code sent to email here above.',
                  style: GoogleFonts.urbanist(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          utils.buttons.authButton(
            'Confirm Reset Code',
            controller.verifyCode,
            context,
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }
}
