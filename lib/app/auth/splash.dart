import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  final utils = Utils();

  @override
  Widget build(BuildContext context) {
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
