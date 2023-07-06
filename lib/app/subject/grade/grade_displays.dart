import 'package:audread/app/subject/grade/single_grade_view.dart';
import 'package:audread/app/widgets/topic_container.dart';
import 'package:audread/configs/themes/loading_theme.dart';
import 'package:audread/models/grade.dart';
import 'package:audread/services/storage/topic_storage.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

final loadingTheme = CardLoadingAudTheme();
var brightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;

class GradeDisplay extends StatefulWidget {
  const GradeDisplay({Key? key}) : super(key: key);

  @override
  GradeDisplayState createState() => GradeDisplayState();
}

class GradeDisplayState extends State<GradeDisplay> {
  List grades = [
    GradeModel(gradeId: '1', gradeName: 'Form One'),
    GradeModel(gradeId: '2', gradeName: 'Form Two'),
    GradeModel(gradeId: '3', gradeName: 'Form Three'),
    GradeModel(gradeId: '4', gradeName: 'Form Four'),
  ];

  final cardLoadingTheme = !isDarkMode
      ? CardLoadingAudTheme.lightTheme
      : CardLoadingAudTheme.darkTheme;

  loadingCard(double height, [width]) {
    return CardLoading(
      height: height,
      width: width,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      margin: const EdgeInsets.only(bottom: 10),
      cardLoadingTheme: cardLoadingTheme,
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (GradeModel grade in grades) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                grade.gradeName.toString(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              TextButton(
                onPressed: () {
                  Get.to(const SingleGradeView());
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: const CircleBorder(),
                ),
                child: Text(
                  '- See All',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder(
              future: TopicStorage().getTopicsByGrade(grade.gradeId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final topics = snapshot.data;
                  return Row(
                    children: [
                      for (var topic in topics) ...[
                        TopicContainer(grade: grade, topic: topic),
                        const SizedBox(width: 20),
                      ],
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 1; i < 4; i++) ...[
                        loadingCard(
                            162, MediaQuery.of(context).size.width * 0.6),
                        const SizedBox(width: 10),
                      ],
                    ],
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
