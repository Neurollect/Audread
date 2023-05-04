import 'package:audread/controllers/splash_controller.dart';
import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  final utils = Utils();
  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.splashAnimation();
    return Scaffold(
      body: Center(
        child: Text(
          'AUDREAD',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
