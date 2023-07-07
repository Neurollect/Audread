import 'package:audread/app/subject/grade/subject_header.dart';
import 'package:audread/app/widgets/topic_in_single_grade_view_container.dart';
import 'package:audread/models/grade.dart';
import 'package:audread/models/subject.dart';
import 'package:audread/services/storage/topic_storage.dart';
import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

final utils = Utils();

class SingleGradeView extends StatefulWidget {
  const SingleGradeView({
    Key? key,
    required this.grade,
    required this.subject,
  }) : super(key: key);
  final SubjectModel? subject;
  final GradeModel? grade;

  @override
  SingleGradeViewState createState() => SingleGradeViewState();
}

class SingleGradeViewState extends State<SingleGradeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubjectHeader(
                  subject: widget.subject!.name.toString(), genre: ''),
              const SizedBox(height: 20),
              FutureBuilder(
                future: TopicStorage().getTopicsByGrade(widget.grade!.gradeId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final topics = snapshot.data;
                    return Column(
                      children: [
                        TextFormField(
                          textAlign: TextAlign.center,
                          decoration: utils.inputFields
                              .topicSearchButtonDecoration(context),
                        ),
                        const SizedBox(height: 20),
                        for (var topic in topics!) ...[
                          TopicInSingleGradeViewContainer(topic: topic),
                          const SizedBox(height: 20),
                        ],
                      ],
                    );
                  } else {
                    return const Column();
                  }
                },
              ),
              const SizedBox(height: 20),
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
