import 'package:audread/providers/lesson_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            return Container();
          },
        );
      },
    );
  }
}
