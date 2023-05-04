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

  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  verifyCode(context, String codeType, String code) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      if (codeType == 'ResetPassword') {
        final res = await auth.verifyRecoveryCode(email.text, code);
        if (res.runtimeType != User) {
          isLoading(false, context);
          handleExceptions(context, res);
        } else {}
      } else {
        final res = await auth.verifySignUp(email.text, code);
        if (res.runtimeType != User) {
          isLoading(false, context);
          handleExceptions(context, res);
        } else {}
      }
    }
  }
}
