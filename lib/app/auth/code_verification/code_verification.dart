import 'package:audread/app/auth/code_verification/code_verification_form.dart';
import 'package:audread/mixins/loading_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CodeVerification extends StatefulWidget {
  final String codeType;
  final String email;
  final String? password;
  const CodeVerification(
      {Key? key, required this.codeType, required this.email, this.password})
      : super(key: key);

  @override
  CodeVerificationState createState() => CodeVerificationState();
}

class CodeVerificationState extends State<CodeVerification> with LoadingMixin {
  @override
  Widget build(BuildContext context) {
    isLoading(false, context);
    final codeType = widget.codeType;
    final email = widget.email;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: const EdgeInsets.only(left: 18),
          child: TextButton(
            onPressed: () {
              Get.back();
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(31, 0, 145, 255),
              shape: const CircleBorder(),
              foregroundColor: const Color.fromARGB(255, 0, 36, 89),
            ),
            child: const Icon(
              Iconsax.arrow_left,
              size: 30,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(
                'Code\nVerification',
                style: GoogleFonts.urbanist(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              CodeVerificationForm(
                  codeType: codeType, email: email, password: widget.password),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
