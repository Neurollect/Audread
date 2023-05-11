import 'package:audread/services/services.dart';
import 'package:audread/services/supabase/supabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import 'app/auth/splash.dart';
import 'utils/components/loading.dart';
import 'configs/themes/themes.dart';

final services = Services();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await services.hiveStorageService.init();
  await services.supabaseService.init();

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
      builder: LoadingScreen.init(),
      home: Splash(),
    );
  }
}
