import 'package:audread/app/auth/code_verification/code_verification.dart';
import 'package:audread/mixins/loading_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/supabase_authentication.dart';

class DetailsFormController extends GetxController with LoadingMixin {
  static DetailsFormController get instance => Get.find();

  final auth = SupabaseAuthentication(Supabase.instance.client);

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final formKey = GlobalKey<FormState>();

  submitDetails(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      Get.to(
        const CodeVerification(
          codeType: 'SignUpConfirmation',
        ),
      );
    }
  }
}
