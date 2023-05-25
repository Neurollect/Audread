import 'package:audread/app/subject/topic/next_lesson.dart';
import 'package:audread/app/widgets/topic_view_header.dart';
import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'lesson.test.dart';

final utils = Utils();

class LessonView extends StatefulWidget {
  const LessonView({Key? key}) : super(key: key);

  @override
  LessonViewState createState() => LessonViewState();
}

class LessonViewState extends State<LessonView> {
  List lsn = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              for (var item in LessonViewTestFunction().lessonPlacer(
                lsn,
                context,
              )) ...[
                item,
                const SizedBox(
                  height: 20,
                ),
              ],
              const SizedBox(height: 10),
              const NextLesson(topic: 'Types of Forces'),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
