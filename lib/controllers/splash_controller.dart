import 'package:audread/app/home.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  Future authenticationState() async {
    await Future.wait([
      SupabaseAuth.instance.initialSession,
      Future.delayed(
        const Duration(milliseconds: 2000),
      ),
    ]).then((responseList) async {
      final session = responseList.first as Session?;
      if (session != null) {
        Get.to(const Home());
      } else {
        Get.to(const Home());
      }
    }).catchError((_) {
      Get.to(const Home());
    });
  }
}
