import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  signup() {
    print('A');
    try {
      if (formKey.currentState!.validate()) {
        print('B');
      }
    } catch (e) {
      print('C');
    }
  }
}
