import 'package:audread/app/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double side = MediaQuery.of(context).size.width / 8;
    final List menuItems = [
      ['Home', Iconsax.stop],
      ['AudLabs', Iconsax.d_cube_scan],
      ['AudCoterie- Chat', Iconsax.message_2],
      ['AudTube', Iconsax.video_square],
      ['Help Center', Iconsax.document],
    ];
    final List lowerItems = [
      ['Profile', Iconsax.profile_2user],
      ['Notifications', Iconsax.sms_notification],
      ['Settings', Iconsax.setting_3],
      ['BookMarks', Iconsax.bookmark_2],
    ];

    return Drawer(
      width: MediaQuery.of(context).size.width * 1,
      child: Container(
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 50)),
            Text(
              'Application',
              style: GoogleFonts.urbanist(
                fontSize: 25,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                for (var i in menuItems) ...[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(8),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Icon(
                            i[1],
                            size: side * 0.6,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          i[0],
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ],
            ),
            const SizedBox(height: 20),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 20),
            Text(
              'Account',
              style: GoogleFonts.urbanist(
                fontSize: 25,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                for (var i in lowerItems) ...[
                  TextButton(
                    onPressed: () => pageNavigator(context, i[0]),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(8),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Icon(
                            i[1],
                            size: side * 0.6,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          i[0],
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void pageNavigator(context, String page) {
    switch (page) {
      case 'Home':
        Navigator.pop(context);
        break;

      case 'AudLabs':
        Navigator.pop(context);
        break;

      case 'AudCoterie- Chat':
        Navigator.pop(context);
        break;

      case 'AudTube':
        Navigator.pop(context);
        break;

      case 'Help Center':
        Navigator.pop(context);
        break;

      case 'Profile':
        Navigator.pop(context);
        break;

      case 'Notifications':
        Navigator.pop(context);
        break;

      case 'Settings':
        Navigator.pop(context);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const SettingsScreen(),
          ),
        );
        break;

      case 'BookMarks':
        Navigator.pop(context);
        break;

      default:
        Navigator.pop(context);
    }
  }
}
