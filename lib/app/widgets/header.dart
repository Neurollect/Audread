import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AudHeader extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const AudHeader({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  AudHeaderState createState() => AudHeaderState();
}

class AudHeaderState extends State<AudHeader> {
  @override
  Widget build(BuildContext context) {
    double side = MediaQuery.of(context).size.width / 8;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Joseph',
              style: GoogleFonts.urbanist(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '22 Oct',
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
                image: const DecorationImage(
                  opacity: 0.8,
                  image: AssetImage('assets/images/avatars/mikee.png'),
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
