import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../providers/lesson_provider.dart';
import '../topic/topic_view_header.dart';
import 'lesson_dialogue.dart';
import 'lesson_loading.dart';
import 'next_lesson.dart';
import 'lesson_structurer.dart';

class LessonView extends StatefulWidget {
  const LessonView({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  LessonViewState createState() => LessonViewState();
}

class LessonViewState extends State<LessonView> {
  GlobalKey<ScaffoldState> lsnScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
  }

  displayDialog(anyFunction) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      BuildContext lsntxt = lsnScaffoldKey.currentContext ?? context;
      Future.delayed(const Duration(milliseconds: 1000), () {
        showDialog(
          barrierColor: const Color.fromARGB(5, 71, 71, 71),
          barrierDismissible: false,
          context: lsntxt,
          builder: (context) {
            return LessonAlertDialog(
              title: 'Error 3022',
              description: 'Could not get Lesson',
              callBack: anyFunction,
            );
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LessonDisplayProvider>(
      create: (context) => LessonDisplayProvider(),
      builder: (context, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<LessonDisplayProvider>().getLesson(widget.id);
        });
        return Consumer<LessonDisplayProvider>(
          builder: (context, provider, child) {
            var lesson = provider.lesson;
            LessonStates lsnState = provider.lessonState;
            if (lsnState == LessonStates.fetchError) {
              displayDialog(provider.tryAgain);
            }
            return Scaffold(
              key: lsnScaffoldKey,
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
