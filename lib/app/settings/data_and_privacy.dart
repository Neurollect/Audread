import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'texts/data_privacy_text.dart';

final utils = Utils();

class DataAndPrivacyScreen extends StatefulWidget {
  const DataAndPrivacyScreen({Key? key}) : super(key: key);

  @override
  DataAndPrivacyScreenState createState() => DataAndPrivacyScreenState();
}

class DataAndPrivacyScreenState extends State<DataAndPrivacyScreen>
    with DataPrivacyText {
  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 15),
              Text(
                'Data and\nPrivacy',
                style: GoogleFonts.urbanist(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                statement,
                textAlign: TextAlign.justify,
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              for (var info in info) ...[
                Text(
                  info[0],
                  style: GoogleFonts.urbanist(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  info[1],
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
              ]
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}