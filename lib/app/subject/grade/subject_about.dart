import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectAbout extends StatefulWidget {
  const SubjectAbout({Key? key}) : super(key: key);

  @override
  SubjectAboutState createState() => SubjectAboutState();
}

class SubjectAboutState extends State<SubjectAbout> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 5;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/images/home/wyltl.png'),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'About Subject',
          style: GoogleFonts.urbanist(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'We dont really know what Shakespeare looked like, Someone else wrote the Shakespeare play..',
          style: GoogleFonts.urbanist(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
