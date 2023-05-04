import 'package:audread/app/auth/code_verification/code_verification.dart';
import 'package:audread/mixins/loading_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/supabase_authentication.dart';

class SignupController extends GetxController with LoadingMixin {
  static SignupController get instance => Get.find();

  final auth = SupabaseAuthentication(Supabase.instance.client);

  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  signup(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      final res = await auth.signUpEmailAndPassword(
        email.text,
        password.text,
      );
      if (res.runtimeType == AuthException) {
        isLoading(false, context);
      }
      Get.to(
        const CodeVerification(
          codeType: 'SignUpConfirmation',
        ),
      );
    }
  }
}
