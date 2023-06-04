import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '_topic_info.dart';
import 'next_topic.dart';
import 'topic_view_header.dart';
import 'subtopics_list.dart';
import '../../widgets/continue_last_lesson.dart';

final utils = Utils();

class TopicView extends StatefulWidget {
  const TopicView({Key? key}) : super(key: key);

  @override
  TopicViewState createState() => TopicViewState();
}

class TopicViewState extends State<TopicView> {
  bool _searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const TopicViewHeader(
          title: 'Introduction to Physics',
        ),
        leadingWidth: double.infinity,
        toolbarHeight: 90,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ContinueLastLesson(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Lessons',
                      style: GoogleFonts.urbanist(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (_searching) ...[
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        decoration: utils.inputFields
                            .topicSearchButtonDecoration(context),
                        style: GoogleFonts.urbanist(
                          fontSize: 21,
                        ),
                      ),
                    )
                  ] else ...[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _searching = true;
                        });
                      },
                      icon: const Icon(
                        Iconsax.search_normal_1,
                        weight: 20,
                      ),
                    )
                  ],
                ],
              ),
              const SizedBox(height: 10),
              SubtopicsList(subtopics: TopicDetails().topic[0]),
              const NextTopic(topic: 'Some Topic'),
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
