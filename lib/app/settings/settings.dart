import 'package:audread/app/settings/developer_info.dart';
import 'package:audread/app/settings/general_settings.dart';
import 'package:audread/app/settings/profile_settings.dart';
import 'package:audread/mixins/loading_mixin.dart';
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

class SettingsScreenState extends State<SettingsScreen> with LoadingMixin {
  final List settingsItems = [
    [Iconsax.setting_3, 'General\nSettings', Colors.orange],
    [Iconsax.emoji_happy, 'Account\nSettings', Colors.blue],
    [Iconsax.message_question, 'Help\nCenter', Colors.lightGreenAccent],
    [Iconsax.code, 'General\nInfo', Colors.purpleAccent],
  ];

  final List<List<String>> settingsBottomItems = [
    ['Share This App', 'Helps us achieve our goal of reaching 2000 students'],
    ['Rate Our App', 'Give us your feedback, It will Motivate'],
  ];

  @override
  Widget build(BuildContext context) {
    isLoading(false, context);
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
                      onPressed: () => navigation(i[1]),
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
                      onPressed: () => navigation(i[1]),
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
              const SizedBox(height: 20),
              const Divider(),
              ListView(
                shrinkWrap: true,
                children: [
                  for (var i in settingsBottomItems) ...[
                    TextButton(
                      onPressed: () => Get.to(const SettingsScreen()),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(right: 20),
                        foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                      ),
                      child: ListTile(
                        trailing: TextButton(
                          onPressed: () => Get.to(const SettingsScreen()),
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(31, 0, 145, 255),
                            shape: const CircleBorder(),
                            foregroundColor:
                                const Color.fromARGB(255, 0, 36, 89),
                          ),
                          child: const Icon(
                            Iconsax.arrow_right,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        title: Text(
                          i[0],
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          i.last,
                          style: GoogleFonts.urbanist(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  navigation(page) {
    switch (page) {
      case 'General\nSettings':
        Get.to(const GeneralSettingsScreen());
        break;

      case 'Account\nSettings':
        Get.to(const ProfileSettings());
        break;

      case 'General\nInfo':
        Get.to(const DeveloperInfoScreen());
        break;

      case 'Help\nCenter':
        break;

      case 'Share this App':
        break;

      default:
        Get.to(const SettingsScreen());
    }
  }
}
