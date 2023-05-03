import 'package:audread/mixins/loading_mixin.dart';
import 'package:audread/services/supabase_authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninController extends GetxController with LoadingMixin {
  static SigninController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  final auth = SupabaseAuthentication(Supabase.instance.client);

  void signin(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      final res = await auth.signInEmailAndPassword(
        email.text,
        password.text,
      );
      if (res.runtimeType == AuthException) {
        isLoading(false, context);
      }
    }
  }
}
