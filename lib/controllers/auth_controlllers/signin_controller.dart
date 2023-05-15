import 'package:audread/app/auth/code_verification/code_verification.dart';
import 'package:audread/mixins/handle_exception_mixin.dart';
import 'package:audread/mixins/loading_mixin.dart';
import 'package:audread/services/supabase/supabase_authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninController extends GetxController
    with LoadingMixin, HandleExceptions {
  static SigninController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  final auth = SupabaseAuthentication(Supabase.instance.client);

  void signin(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      final res = await auth.signInEmailAndPassword(
        email.value.text,
        password.value.text,
      );
      if (res.runtimeType != User) {
        isLoading(false, context);
        handleExceptions(context, res);

        if (res.message == 'Email Not Confirmed') {
          Get.to(CodeVerification(
            codeType: 'Signup',
            email: email.value.text,
            password: password.value.text,
          ));
        }
      } else {
        handleSuccess(context, 'Welcome Back');
      }
    }
  }
}
