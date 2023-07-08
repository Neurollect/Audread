import 'package:audread/models/member.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jiffy/jiffy.dart';

import '../../utils/utils.dart';

final utils = Utils();

class AudHeader extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const AudHeader({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  AudHeaderState createState() => AudHeaderState();
}

class AudHeaderState extends State<AudHeader> {
  late MemberModel member = MemberModel(id: 'id');

  void getUserFromStorage() async {
    final memberBox = await Hive.openBox<MemberModel>('member_box');
    setState(() {
      member = memberBox.get('member')!;
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
  Widget build(BuildContext context) {
    double side = MediaQuery.of(context).size.width / 8;
    String avatar = member.avatar == null
        ? 'assets/images/avatars/obi.png'
        : getUserAvatar(member.avatar);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${member.firstName}',
              style: GoogleFonts.urbanist(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              Jiffy.now().MMMd,
              style: GoogleFonts.urbanist(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: side * 0.9,
              width: side * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  opacity: 0.8,
                  image: AssetImage(avatar),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: side * 0.9,
              width: side * 0.9,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  widget.scaffoldKey.currentState!.openDrawer();
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Icon(
                  Iconsax.microscope,
                  size: side * 0.7,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
