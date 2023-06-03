import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../providers/lesson_provider.dart';
import '../../widgets/topic_view_header.dart';
import 'lesson_dialogue.dart';
import 'lesson_loading.dart';
import 'next_lesson.dart';
import 'lesson_structurer.dart';

class LessonView extends StatefulWidget {
  const LessonView({Key? key}) : super(key: key);

  @override
  LessonViewState createState() => LessonViewState();
}

class LessonViewState extends State<LessonView> {
  displayDialog() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        barrierColor: const Color.fromARGB(30, 44, 42, 42),
        context: context,
        builder: (context) {
          return const LessonAlertDialog();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LessonDisplayProvider>(
      create: (context) => LessonDisplayProvider(),
      builder: (context, _) {
        return Consumer<LessonDisplayProvider>(
          builder: (context, provider, child) {
            var lesson = provider.lesson;
            provider.getLesson();
            if (provider.lessonState == LessonStates.fetchError) {
              displayDialog();
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                leading: TopicViewHeader(
                  title: lesson.lessonTitle,
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
                      if (provider.lessonState == LessonStates.loading) ...[
                        LessonLoading(),
                      ] else ...[
                        if (provider.lessonState ==
                            LessonStates.fetchError) ...[
                          LessonLoading(),
                        ] else ...[
                          for (var item
                              in LessonWidgetsStructurer().lessonPlacer(
                            provider.stuctureLesson(),
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
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
