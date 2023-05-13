import 'package:audread/app/auth/signup/details_signup.dart';
import 'package:audread/app/auth/welcome/welcome.dart';
import 'package:audread/controllers/secret_loader_controller.dart';
import 'package:audread/models/secret.dart';
import 'package:audread/models/user.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:audread/app/settings/settings.dart';

final supabase = Supabase.instance.client;

class SupabaseService {
  init() async {
    Secret secret = await SecretLoader().load();
    await Supabase.initialize(
      url: secret.supabaseUrl,
      anonKey: secret.supabaseAnonKey,
    );
  }

  void listentoHeaders() async {
    /// Listen for authentication events and redirect to
    /// correct page when key events are detected.
    Supabase.instance.client.auth.onAuthStateChange.listen((authState) {
      final event = authState.event;
      final session = authState.session;
      if (event == AuthChangeEvent.signedIn) {
        if (session != null) {
          iniload();
        } else {
          Get.to(const WelcomeScreen());
        }
      } else if (event == AuthChangeEvent.signedOut) {
        Get.to(const WelcomeScreen());
      }
    });
  }

  iniload() async {
    final userBox = await Hive.openBox<UserModel>('user_box');
    final user = userBox.get('user');
    bool isNew = user?.isNewUser == null;
    if (isNew) {
      Get.to(const DetailsSignup());
    } else {
      Get.to(const SettingsScreen());
    }
  }
}
