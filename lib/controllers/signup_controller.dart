import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  signup() {
    try {
      if (formKey.currentState!.validate()) {}
    } catch (e) {
      return e;
    }
  }
}
