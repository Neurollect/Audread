import 'package:audread/app/subject/grade/subject_header.dart';
import 'package:audread/app/subject/topic/topic_loading.dart';
import 'package:audread/providers/topic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../widgets/continue_last_lesson.dart';
import 'next_topic.dart';
import 'subtopics_list.dart';
import 'topic_dialog.dart';

class TopicProv extends StatefulWidget {
  const TopicProv({Key? key, required this.topicId}) : super(key: key);
  final String topicId;

  @override
  TopicProvState createState() => TopicProvState();
}

class TopicProvState extends State<TopicProv> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

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
          context.read<TopicDisplayProvider>().getTopic(widget.topicId);
        });
        return Consumer<TopicDisplayProvider>(
          builder: (context, provider, child) {
            var topic = provider.topic;
            var topicState = provider.topicState;
            if (topicState == TopicViewState.fetchError) {
              displayDialog(provider.tryAgain);
            }
            return Scaffold(
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
                          SubjectHeader(
                            subject: topic.topicName,
                            genre: 'genre',
                          ),
                          if (provider.isContinueFromPrevAvailable) ...[
                            const ContinueLastLesson(),
                          ],

                          _controller.value.isInitialized
                              ? AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller),
                                )
                              : Container(),

                          //Subtopics List
                          SubtopicsList(topicId: topic.topicId),

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
