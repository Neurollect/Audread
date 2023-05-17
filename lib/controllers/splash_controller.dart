import 'package:audread/app/auth/welcome/welcome.dart';
import 'package:audread/app/home.dart';
import 'package:audread/models/user.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../app/auth/signup/details_signup.dart';

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
      final session = response as Session?;
      if (session != null) {
        await iniload();
      } else {
        Get.to(const WelcomeScreen());
      }
    } catch (e) {
      Get.to(const WelcomeScreen());
    }
  }

  iniload() async {
    final userBox = await Hive.openBox<UserModel>('user_box');
    final user = userBox.get('user');
    bool isNew = user?.isNewUser == null || user?.isNewUser == true;
    if (isNew) {
      Get.to(const DetailsSignup());
    } else {
      Get.to(const HomePage());
    }
  }
}
