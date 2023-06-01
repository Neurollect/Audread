import 'package:audread/utils/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LessonError extends StatefulWidget {
  const LessonError({Key? key}) : super(key: key);

  @override
  LessonErrorState createState() => LessonErrorState();
}

class LessonErrorState extends State<LessonError> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(image: AssetImage('assets/images/error/conn_error.png')),
        LoadingAnimationWidget.waveDots(
          color: utils.globalColors.primary,
          size: 50,
        ),
        const SizedBox(height: 10),
        Text(
          'Could not Fetch Lesson',
          style: GoogleFonts.urbanist(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          'Would you like to Try Again?',
          style: GoogleFonts.urbanist(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
