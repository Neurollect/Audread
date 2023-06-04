import 'package:audread/app/subject/topic/topic_loading.dart';
import 'package:audread/providers/topic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../widgets/continue_last_lesson.dart';
import 'next_topic.dart';
import 'subtopics_list.dart';
import 'topic_dialog.dart';
import 'topic_view_header.dart';

class TopicProv extends StatefulWidget {
  const TopicProv({Key? key}) : super(key: key);

  @override
  TopicProvState createState() => TopicProvState();
}

class TopicProvState extends State<TopicProv> {
  displayDialog(anyFunction) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        showDialog(
          barrierColor: const Color.fromARGB(5, 71, 71, 71),
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return TopicDialog(
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
    return ChangeNotifierProvider<TopicDisplayProvider>(
      create: (context) => TopicDisplayProvider(),
      builder: (context, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<TopicDisplayProvider>().getTopic();
        });
        return Consumer<TopicDisplayProvider>(
          builder: (context, provider, child) {
            var topic = provider.topic;
            var topicState = provider.topicState;
            if (topicState == TopicViewState.fetchError) {
              displayDialog(provider.tryAgain);
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                leading: TopicViewHeader(
                  title: topic.topicName,
                ),
                leadingWidth: double.infinity,
                toolbarHeight: 90,
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (provider.topicState == TopicViewState.loading ||
                          provider.topicState == TopicViewState.fetchError) ...[
                        TopicLoading(),
                      ] else
                        ...[
                          if (provider.isContinueFromPrevAvailable) ...[
                            const ContinueLastLesson(),
                          ],

                          //Subtopics List
                          SubtopicsList(getSubtopics: provider.getSubtopics),

                          //Next Topic
                          const NextTopic(topic: 'Some Topic'),
                          const SizedBox(height: 10),
                        ].animate().fade(
                              duration: const Duration(
                                milliseconds: 1000,
                              ),
                            ),
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
