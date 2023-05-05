import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

final utils = Utils();

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  final List settingsItems = [
    [
      Iconsax.setting_3,
      'General\nSettings',
      Colors.red,
      utils.images.settingImages[0]
    ],
    [
      Iconsax.user_edit,
      'Profile\nSettings',
      Colors.blue,
      utils.images.settingImages[1]
    ],
    [
      Iconsax.lock,
      'Data &\nPrivacy',
      Colors.lightGreen,
      utils.images.settingImages[2]
    ],
    [
      Iconsax.people,
      'Developer\nInfo',
      Colors.amber,
      utils.images.settingImages[3]
    ],
  ];

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
                'App\nSettings',
                style: GoogleFonts.urbanist(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i in settingsItems.reversed.skip(2)) ...[
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        elevation: 5,
                        backgroundColor: i[2],
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 150,
                        padding: const EdgeInsets.all(13),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(i[0], size: 40),
                            Text(
                              i[1],
                              style: GoogleFonts.urbanist(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                  ],
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i in settingsItems.skip(2)) ...[
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        elevation: 5,
                        backgroundColor: i[2],
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 150,
                        padding: const EdgeInsets.all(13),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(i[0], size: 40),
                            Text(
                              i[1],
                              style: GoogleFonts.urbanist(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
