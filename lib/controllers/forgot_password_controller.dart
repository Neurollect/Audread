import 'package:audread/app/auth/code_verification/code_verification.dart';
import 'package:audread/mixins/loading_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/supabase_authentication.dart';

class ForgetPasswordController extends GetxController with LoadingMixin {
  static ForgetPasswordController get instance => Get.find();

  final auth = SupabaseAuthentication(Supabase.instance.client);

  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  sendResetCode(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      final res = await auth.sendRecoveryCode(
        email.text,
      );
      Get.to(const CodeVerification(
        codeType: 'ResetPassword',
      ));
      if (res.runtimeType == AuthException) {
        isLoading(false, context);
      }
    }
  }
}
