import 'package:audread/app/auth/code_verification/code_verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  sendResetCode() {
    try {
      if (formKey.currentState!.validate()) {
        Get.to(const CodeVerification());
      }
    } catch (e) {
      return e;
    }
  }
}
