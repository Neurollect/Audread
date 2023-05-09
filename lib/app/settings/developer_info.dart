import 'package:audread/app/settings/info_display.dart';
import 'package:audread/app/settings/texts/data_privacy_text.dart';
import 'package:audread/app/settings/texts/developer_info_text.dart';
import 'package:audread/app/settings/texts/terms_and_conditions_text.dart';
import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'settings.dart';

final utils = Utils();

class DeveloperInfoScreen extends StatefulWidget {
  const DeveloperInfoScreen({Key? key}) : super(key: key);

  @override
  DeveloperInfoScreenState createState() => DeveloperInfoScreenState();
}

class DeveloperInfoScreenState extends State<DeveloperInfoScreen> {
  final termsAndConditionstext = TermsAndConditionsText();
  final privacyPolicytext = DataPrivacyText();
  final securitytext = TermsAndConditionsText();
  final developerInfotext = DeveloperInfoText();

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
                'Audread\nInfo & Credits',
                style: GoogleFonts.urbanist(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ListView(
                shrinkWrap: true,
                children: [
                  //Notifications
                  TextButton(
                    onPressed: () => Get.to(
                      InfoDisplayScreen(
                        title: 'Terms and Conditions',
                        statement: termsAndConditionstext.statement,
                        info: termsAndConditionstext.info,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Iconsax.menu_board,
                        size: 30,
                        color: Colors.black,
                      ),
                      trailing: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(31, 0, 145, 255),
                          shape: const CircleBorder(),
                          foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                        ),
                        child: const Icon(
                          Iconsax.arrow_right,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        'Terms and Conditions',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Community Guidelines',
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //Language Tile
                  TextButton(
                    onPressed: () => Get.to(
                      InfoDisplayScreen(
                        title: 'Privacy Policy',
                        statement: privacyPolicytext.statement,
                        info: privacyPolicytext.info,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Iconsax.lock,
                        size: 30,
                        color: Colors.black,
                      ),
                      trailing: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(31, 0, 145, 255),
                          shape: const CircleBorder(),
                          foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                        ),
                        child: const Icon(
                          Iconsax.arrow_right,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        'Privacy Policy',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Our Application Policies',
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //Appearance
                  TextButton(
                    onPressed: () => Get.to(
                      InfoDisplayScreen(
                        title: 'Security',
                        statement: securitytext.statement,
                        info: securitytext.info,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Iconsax.key_square,
                        size: 30,
                        color: Colors.black,
                      ),
                      trailing: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(31, 0, 145, 255),
                          shape: const CircleBorder(),
                          foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                        ),
                        child: const Icon(
                          Iconsax.arrow_right,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        'Security',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Making secure',
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //Dark Mode
                  TextButton(
                    onPressed: () => Get.to(
                      InfoDisplayScreen(
                        title: 'Developer Info & Credits',
                        info: developerInfotext.info,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Iconsax.convert_3d_cube,
                        size: 30,
                        color: Colors.black,
                      ),
                      trailing: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(31, 0, 145, 255),
                          shape: const CircleBorder(),
                          foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                        ),
                        child: const Icon(
                          Iconsax.arrow_right,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        'Developer Info & Credits',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'About the developer',
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
