import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool validateEmail(String email) {
    final bool isValid = EmailValidator.validate(email);
    return isValid;
  }
}
