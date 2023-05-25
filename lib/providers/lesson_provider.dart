import 'dart:convert';

import 'package:audread/models/lesson.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LessonDisplayProvider with ChangeNotifier {
  LessonModel lesson = LessonModel(
    lessonId: 'lessonId',
  );

  Future getLesson() async {
    final lessonBox = await Hive.openBox<LessonModel>('lessons');
    lesson = lessonBox.get('this_lesson')!;
    notifyListeners();
  }

  loaLesson() async {
    final Map<String, dynamic> less = json.decode(lesson.lessonBody.toString());
    List lessList = [];
    for (var i in less.values) {
      i as Map<String, dynamic>;
      for (var j in i.values) {
        j as Map<String, dynamic>;
        lessList.add(j);
      }
    }
    return lessList;
  }
}
