import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final utils = Utils();

class LessonWidgetsStructurer {
  lessonPlacer(List lesson, context) {
    var lsnView = [];
    for (var lsn in lesson) {
      lsn as Map<String, dynamic>;
      switch (lsn.keys.first) {
        case 'normal_text':
          lsnView.add(
            Text(
              lsn.values.first,
              textAlign: TextAlign.justify,
              style: GoogleFonts.urbanist(
                fontSize: 20,
              ),
            ),
          );
          break;
        case 'subtitle_text':
          lsnView.add(
            Text(
              lsn.values.first,
              style: GoogleFonts.urbanist(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
          break;
        case 'image':
          double height = MediaQuery.of(context).size.height / 4;
          lsnView.add(
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
          );
          break;
        default:
          Text(
            '',
            style: GoogleFonts.urbanist(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          );
      }
    }
    return lsnView;
  }
}
