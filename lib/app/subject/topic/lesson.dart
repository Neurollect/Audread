import 'package:audread/app/subject/topic/next_lesson.dart';
import 'package:audread/app/widgets/topic_view_header.dart';
import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'lesson_loader.dart';

final utils = Utils();

class LessonView extends StatefulWidget {
  const LessonView({Key? key}) : super(key: key);

  @override
  LessonViewState createState() => LessonViewState();
}

class LessonViewState extends State<LessonView> {
  final List points = [
    'Make a stationary object start moving or increase the speed of a moving object.',
    'Slow down or stop a moving object.',
    'Change the direction of a moving object.',
    'Distort (change the shape of) an object.',
  ];

  late var lesson;

  loadLesson() async {
    var less = await LessonLoader().load();
    setState(() {
      lesson = less;
    });
  }

  @override
  void initState() {
    loadLesson();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 4;
    print(lesson);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const TopicViewHeader(
          title: 'Physics: Force',
        ),
        leadingWidth: double.infinity,
        toolbarHeight: 90,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Introduction',
                textAlign: TextAlign.justify,
                style: GoogleFonts.urbanist(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'You may have observed a person kicking a ball in the field or a group of people participating in a tug of war. You may also have seen a mason lifting a stone at a construction site or people pushing a car stuck in mud',
                textAlign: TextAlign.justify,
                style: GoogleFonts.urbanist(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
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
                'A force is a push or pull. The SI unit of force is the newton (N). A force acts in a particular direction and may have any of the following effects on an object:',
                textAlign: TextAlign.justify,
                style: GoogleFonts.urbanist(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              for (int i = 0; i < points.length; i++) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (i + 1).toString(),
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.urbanist(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        points[i],
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.urbanist(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
              ],
              const SizedBox(height: 10),
              Text(
                "Force is, therefore, that which changes a body's state of motion or shape. Some forces are small while others are large. Forces, therefore, have size  magnitude). A force is represented by a line with an arrow showing the direction in which it acts, thus:",
                textAlign: TextAlign.justify,
                style: GoogleFonts.urbanist(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const NextLesson(topic: 'Types of Forces'),
              const SizedBox(height: 10),
            ].animate().fade(
                  duration: const Duration(
                    milliseconds: 1000,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
