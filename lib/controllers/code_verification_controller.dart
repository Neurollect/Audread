import 'package:audread/mixins/loading_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/supabase_authentication.dart';

class CodeVerificationController extends GetxController with LoadingMixin {
  static CodeVerificationController get instance => Get.find();

  final auth = SupabaseAuthentication(Supabase.instance.client);

  final email = TextEditingController();
  final code = '';
  final formKey = GlobalKey<FormState>();

  verifyCode(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      final res = await auth.verifyRecoveryCode(email.text, code);
      if (res.runtimeType == AuthException) {}
    }
  }
}
