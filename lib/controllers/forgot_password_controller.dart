import 'package:audread/app/auth/code_verification/code_verification.dart';
import 'package:audread/mixins/handle_exception_mixin.dart';
import 'package:audread/mixins/loading_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/supabase_authentication.dart';

class ForgetPasswordController extends GetxController
    with LoadingMixin, HandleExceptions {
  static ForgetPasswordController get instance => Get.find();

  final auth = SupabaseAuthentication(Supabase.instance.client);

  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  sendResetCode(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      final res = await auth.sendRecoveryCode(
        email.value.text,
      );
      var mail = email.value.text;
      if (res.runtimeType != String) {
        isLoading(false, context);
        handleExceptions(context, res);
      } else {
        handleSuccess(context, res);
        Get.to(CodeVerification(
          codeType: 'ResetPassword',
          email: mail,
        ));
      }
    }
  }
}
