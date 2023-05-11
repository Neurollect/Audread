import 'package:audread/app/auth/code_verification/code_verification.dart';
import 'package:audread/mixins/handle_exception_mixin.dart';
import 'package:audread/mixins/loading_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/supabase_authentication.dart';

class SignupController extends GetxController
    with LoadingMixin, HandleExceptions {
  static SignupController get instance => Get.find();

  final auth = SupabaseAuthentication(Supabase.instance.client);

  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  signup(context, checked) async {
    if (formKey.currentState!.validate()) {
      if (!checked) {
        handleExceptions(
          context,
          'You Must Agree to terms and Conditions to continue',
        );
      } else {
        isLoading(true, context);
        final res = await auth.signUpEmailAndPassword(
          email.value.text,
          password.value.text,
        );
        if (res.runtimeType != User) {
          isLoading(false, context);
          handleExceptions(context, res);
        } else {
          handleSuccess(
            context,
            'Email confirmation code has been sent to your inbox',
          );
          Get.to(
            CodeVerification(
              codeType: 'SignUpConfirmation',
              email: email.value.text,
              password: password.value.text,
            ),
          );
        }
      }
    }
  }
}
