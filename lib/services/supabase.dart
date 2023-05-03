import 'package:audread/app/auth/signin/signin.dart';
import 'package:audread/app/auth/signup/signup.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SupabaseService {
  void listentoHeaders() {
    /// Listen for authentication events and redirect to
    /// correct page when key events are detected.
    Supabase.instance.client.auth.onAuthStateChange.listen((authState) {
      final event = authState.event;
      final session = authState.session;
      if (event == AuthChangeEvent.signedIn) {
        if (session != null) {
          Get.to(const SignUpScreen());
        } else {
          Get.to(const SignInScreen());
        }
      } else if (event == AuthChangeEvent.signedOut) {
        Get.to(const SignInScreen());
      }
    });
  }
}
