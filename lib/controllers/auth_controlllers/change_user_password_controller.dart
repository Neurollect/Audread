import 'package:audread/mixins/handle_exception_mixin.dart';
import 'package:audread/mixins/loading_mixin.dart';
import 'package:audread/services/supabase/supabase_user_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangeUserPasswordController extends GetxController
    with LoadingMixin, HandleExceptions {
  static ChangeUserPasswordController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final opassword = TextEditingController();
  final npassword = TextEditingController();

  final auth = SupabaseUserServices(Supabase.instance.client);

  void changeUserPassword(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      final res = await auth.chageUserPassword(
        opassword.value.text,
        npassword.value.text,
      );
      if (res.runtimeType == PostgrestException) {
        isLoading(false, context);
        handleExceptions(context, res);
      } else {
        isLoading(false, context);
        handleSuccess(context, 'Password Successfully changed');
      }
      isLoading(false, context);
    }
  }
}
