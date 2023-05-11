import 'package:audread/app/auth/welcome/welcome.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:audread/app/settings/settings.dart';

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
          Get.to(const SettingsScreen());
        } else {
          Get.to(const WelcomeScreen());
        }
      } else if (event == AuthChangeEvent.signedOut) {
        Get.to(const WelcomeScreen());
      }
    });
  }
}
