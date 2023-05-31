import 'dart:convert';

import 'package:audread/models/lesson.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum LessonStates {
  loading,
  loaded,
  fetchError,
}

class LessonDisplayProvider with ChangeNotifier {
  LessonStates lessonState = LessonStates.loading;

  LessonModel lesson = LessonModel(
    lessonId: 'lessonId',
  );

  Future getLesson() async {
    try {
      final lessonBox = await Hive.openBox<LessonModel>('lessons');
      lesson = lessonBox.get('this_lesson')!;
      notifyListeners();
    } catch (e) {
      lessonState = LessonStates.fetchError;
      notifyListeners();
    }
  }

  stuctureLesson() {
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
