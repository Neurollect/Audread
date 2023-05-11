import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

final utils = Utils();

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({Key? key}) : super(key: key);

  @override
  GeneralSettingsScreenState createState() => GeneralSettingsScreenState();
}

class GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
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
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(
                'General\nSettings',
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
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Iconsax.notification_status,
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
                        'Notifications',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Display Notifications',
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
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Iconsax.global,
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
                        'Language',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'English (Default)',
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
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Iconsax.bucket_square,
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
                        'Appearance',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Medium (Default)',
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
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Iconsax.moon,
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
                        'Theme Mode',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Detect System (Default)',
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
