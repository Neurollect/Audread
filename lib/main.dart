import 'package:audread/services/supabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/auth/splash.dart';
import 'configs/themes/themes.dart';
import 'controllers/secret_loader_controller.dart';
import 'models/secret.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Secret secret = await SecretLoader().load();

  await Supabase.initialize(
    url: secret.supabaseUrl,
    anonKey: secret.supabaseAnonKey,
  );

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SupabaseService().listentoHeaders();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Audread',
      theme: AppAudTheme.lightTheme,
      darkTheme: AppAudTheme.darkTheme,
      home: Splash(),
    );
  }
}
