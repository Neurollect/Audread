import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

final utils = Utils();

class RequestAccountInfor extends StatefulWidget {
  const RequestAccountInfor({Key? key}) : super(key: key);

  @override
  RequestAccountInforState createState() => RequestAccountInforState();
}

class RequestAccountInforState extends State<RequestAccountInfor> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final organizations = [
    ['Veritasium', 'An element of truth - videos about science, education'],
    [
      'Physics Girl',
      'Unrepentant science nerd. In addition to founding and continuing to run Skepchick'
    ],
    [
      'Kurzgezast',
      'Animation videos explaining things with optimistic nihilism since 12013'
    ],
    ['Vsauce', 'Deeper dive into the mysterious depths of the human psyche.'],
  ];

  @override
  Widget build(BuildContext context) {
    //double side = MediaQuery.of(context).size.width / 6;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: const EdgeInsets.only(left: 18),
          child: TextButton(
            onPressed: () {
              Get.back();
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(31, 0, 145, 255),
              shape: const CircleBorder(),
              foregroundColor: const Color.fromARGB(255, 0, 36, 89),
            ),
            child: const Icon(
              Iconsax.arrow_left,
              size: 30,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Request\nAccount\nInformation',
                style: GoogleFonts.urbanist(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Your password',
                      style: GoogleFonts.urbanist(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    utils.inputFields.passwordInput(
                      _obscureText,
                      _toggle,
                    ),
                    const SizedBox(height: 30),
                    utils.buttons.authButton(
                      'Request Info',
                      () => {},
                      context,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
