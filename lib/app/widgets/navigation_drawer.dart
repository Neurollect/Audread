import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double side = MediaQuery.of(context).size.width / 8;
    final List menuItems = [
      ['Audread- Home', Iconsax.barcode],
      ['AudLabs', Iconsax.d_cube_scan],
      ['AudCoterie- Chat', Iconsax.message_text],
      ['AudTube', Iconsax.video],
      ['Help Center', Iconsax.document],
    ];
    final List lowerItems = [
      'Profile',
      'Notifications',
      'Settings',
      'BookMarks',
    ];
    return Drawer(
      width: MediaQuery.of(context).size.width * 1,
      child: Container(
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.all(36),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 50)),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: Colors.blue.shade900,
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Iconsax.sun,
                          color: Colors.white,
                        ),
                        Text(
                          'DarkMode',
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(-10),
                        bottomLeft: Radius.circular(-10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Iconsax.moon,
                          color: Colors.black,
                        ),
                        Text(
                          'LightMode',
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                for (var i in menuItems) ...[
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
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
            const Divider(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
