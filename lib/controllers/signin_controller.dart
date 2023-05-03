import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  signin() {
    try {
      if (formKey.currentState!.validate()) {}
    } catch (e) {
      return e;
    }
  }
}
