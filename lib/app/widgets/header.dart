import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AudHeader extends StatefulWidget {
  const AudHeader({Key? key}) : super(key: key);

  @override
  AudHeaderState createState() => AudHeaderState();
}

class AudHeaderState extends State<AudHeader> {
  @override
  Widget build(BuildContext context) {
    double side = MediaQuery.of(context).size.width / 6;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '22 Oct',
              style: GoogleFonts.urbanist(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Hi, Joseph',
              style: GoogleFonts.urbanist(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          height: side,
          width: side,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              opacity: 0.8,
              image: AssetImage('assets/images/avatars/mikee.png'),
            ),
          ),
        ),
      ],
    );
  }
}
