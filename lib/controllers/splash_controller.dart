import 'package:audread/app/auth/welcome/welcome.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../app/settings/settings.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  Future splashAnimation() async {
    await Future.wait([
      SupabaseAuth.instance.initialSession,
      Future.delayed(
        const Duration(milliseconds: 3000),
      ),
    ]).then((responseList) async {
      await checkAuthenticationState(responseList.first);
    });
  }

  Future checkAuthenticationState(response) async {
    try {
      final session = response.session;
      if (session != null) {
        Get.to(const SettingsScreen());
      } else {
        Get.to(const SettingsScreen());
      }
    } catch (e) {
      Get.to(const SettingsScreen());
    }
  }
}
