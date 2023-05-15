import 'package:audread/app/widgets/header.dart';
import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';

final utils = Utils();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //double side = MediaQuery.of(context).size.width / 6;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const AudHeader(),
              const SizedBox(height: 40),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: utils.inputFields.searchButtonDecoration(context),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
