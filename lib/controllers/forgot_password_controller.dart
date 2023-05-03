import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  sendResetCode() {
    try {
      if (formKey.currentState!.validate()) {}
    } catch (e) {
      return e;
    }
  }
}
