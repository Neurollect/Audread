import 'package:audread/app/settings/account_settings/account_details.dart';
import 'package:audread/app/settings/account_settings/my_organizations.dart';
import 'package:audread/app/settings/account_settings/request_info.dart';
import 'package:audread/app/settings/account_settings/security_and_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/member.dart';
import '../../utils/utils.dart';

final utils = Utils();

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  ProfileSettingsState createState() => ProfileSettingsState();
}

class ProfileSettingsState extends State<ProfileSettings> {
  late MemberModel member = MemberModel(id: 'id');
  late String email = 'loading...';

  void getUserFromStorage() async {
    final memberBox = await Hive.openBox<MemberModel>('member_box');
    final user = Supabase.instance.client.auth.currentUser;

    setState(() {
      member = memberBox.get('member')!;
      email = user!.email.toString();
    });
  }

  getUserAvatar(id) {
    List avatarList = member.gender == 'Male'
        ? utils.avatars.maleAvatars
        : utils.avatars.femaleAvatars;
    return avatarList[id - 1].path;
  }

  @override
  void initState() {
    getUserFromStorage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double side = MediaQuery.of(context).size.width / 6;
    String username = member.firstName == null
        ? 'loading...'
        : '${member.firstName} ${member.lastName}';
    String avatar = member.avatar == null
        ? 'assets/images/avatars/obi.png'
        : getUserAvatar(member.avatar);

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
                'My Account',
                style: GoogleFonts.urbanist(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              //Simple Profile View
              Row(
                children: [
                  Container(
                    height: side,
                    width: side,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        opacity: 0.8,
                        image: AssetImage(avatar),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: GoogleFonts.urbanist(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        email,
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),

              //Account Actions
              ListView(
                shrinkWrap: true,
                children: [
                  //Notifications
                  TextButton(
                    onPressed: () => Get.to(const AccountDetails()),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      trailing: TextButton(
                        onPressed: () => Get.to(const AccountDetails()),
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
                        'Account Details',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'View & Edit Details',
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
                      const SecurityAndPasswordSettings(),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      trailing: TextButton(
                        onPressed: () => Get.to(
                          const SecurityAndPasswordSettings(),
                        ),
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
                        'Security and Password',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Change Password, If Needed',
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
                    onPressed: () => Get.to(const MyOrganizations()),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      trailing: TextButton(
                        onPressed: () => Get.to(const MyOrganizations()),
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
                        'Organizations',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'View my organizations',
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
                    onPressed: () => Get.to(const RequestAccountInfor()),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 20),
                      foregroundColor: const Color.fromARGB(255, 0, 36, 89),
                    ),
                    child: ListTile(
                      trailing: TextButton(
                        onPressed: () => Get.to(const RequestAccountInfor()),
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
                        'Request Account Data',
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Manage account information',
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
