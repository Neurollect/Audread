import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class LessonLoader {
  final String topicPath = 'lib/app/subject/topic/topic.json';

  LessonLoader();
  Future load() {
    return rootBundle.loadStructuredData(topicPath, (jsonStr) async {
      final topic = json.decode(jsonStr);
      return topic;
    });
  }
}
