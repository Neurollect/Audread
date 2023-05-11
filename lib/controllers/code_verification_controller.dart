import 'package:audread/mixins/handle_exception_mixin.dart';
import 'package:audread/mixins/loading_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/supabase_authentication.dart';

class CodeVerificationController extends GetxController
    with LoadingMixin, HandleExceptions {
  static CodeVerificationController get instance => Get.find();

  final auth = SupabaseAuthentication(Supabase.instance.client);

  final formKey = GlobalKey<FormState>();

  verifyCode(context, String codeType, String code, email) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      if (codeType == 'ResetPassword') {
        final res = await auth.verifyRecoveryCode(email, code);
        if (res.runtimeType != String) {
          isLoading(false, context);
          handleExceptions(context, res);
        } else {}
      } else {
        final res = await auth.verifySignUp(email, code);
        if (res.runtimeType != User) {
          isLoading(false, context);
          handleExceptions(context, res);
        } else {}
      }
    }
  }

  resendCode(context, String codeType, email, [password]) async {
    isLoading(true, context);
    if (codeType == 'ResetPassword') {
      final res = await auth.sendRecoveryCode(email);
      if (res.runtimeType != String) {
        isLoading(false, context);
        handleExceptions(context, res);
      } else {
        handleSuccess(context, res);
      }
    } else {
      final res = await auth.signUpEmailAndPassword(email, password);
      if (res.runtimeType != User) {
        isLoading(false, context);
        handleExceptions(context, res);
      } else {
        handleSuccess(context, 'Code has been Resent to your mail');
      }
    }
  }
}
