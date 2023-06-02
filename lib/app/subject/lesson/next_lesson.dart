import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextLesson extends StatelessWidget {
  final String topic;
  const NextLesson({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next Lesson:',
            style: GoogleFonts.urbanist(
              fontSize: 14,
            ),
          ),
          Text(
            topic,
            style: GoogleFonts.urbanist(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
