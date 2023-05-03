import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CodeVerificationController extends GetxController {
  static CodeVerificationController get instance => Get.find();

  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  verifyCode() {
    try {
      if (formKey.currentState!.validate()) {}
    } catch (e) {
      return e;
    }
  }
}
