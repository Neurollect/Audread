import 'package:audread/mixins/loading_mixin.dart';
import 'package:audread/models/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/supabase_authentication.dart';

class DetailsFormController extends GetxController with LoadingMixin {
  static DetailsFormController get instance => Get.find();

  final auth = SupabaseAuthentication(Supabase.instance.client);

  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final organization = TextEditingController();
  final gender = MultiSelectController();
  final avatar = MultiSelectController<AvatarModel>();

  checkContent(context) {
    try {
      gender.getSelectedItems.call().first;
      avatar.getSelectedItems.call().first.name;
    } catch (_) {
      isLoading(false, context);
      return 'Gender and Avatar Required';
    }
  }

  submitDetails(context) async {
    if (formKey.currentState!.validate()) {
      isLoading(true, context);
      checkContent(context);
    }
  }
}
