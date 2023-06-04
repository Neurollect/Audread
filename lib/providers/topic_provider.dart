import 'package:audread/models/topic.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum TopicViewState {
  loading,
  loaded,
  fetchError,
}

class TopicDisplayProvider with ChangeNotifier {
  TopicViewState topicState = TopicViewState.loading;

  TopicModel topic = TopicModel(
    topicId: 'lessonId',
  );

  getLesson() async {
    try {
      final topicBox = await Hive.openBox<TopicModel>('topics');
      topic = topicBox.get('topic')!;
      notifyListeners();
    } catch (e) {
      topicState = TopicViewState.fetchError;
      notifyListeners();
    }
  }

  void tryAgain() {
    topicState = TopicViewState.loading;
    notifyListeners();
  }
}
