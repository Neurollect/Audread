import 'package:audread/app/subject/lesson/lesson_loading.dart';
import 'package:audread/app/widgets/topic_view_header.dart';
import 'package:audread/providers/lesson_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'lesson_error.dart';
import 'next_lesson.dart';
import 'lesson_structurer.dart';

class LessonView extends StatefulWidget {
  const LessonView({Key? key}) : super(key: key);

  @override
  LessonViewState createState() => LessonViewState();
}

class LessonViewState extends State<LessonView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LessonDisplayProvider>(
      create: (context) => LessonDisplayProvider(),
      builder: (context, _) {
        return Consumer<LessonDisplayProvider>(
          builder: (context, provider, child) {
            var lesson = provider.lesson;
            provider.getLesson();
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
                          const LessonError(),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style,
                                  child: Text(
                                    'Go Back',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style,
                                  child: Text(
                                    'Try Again',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
