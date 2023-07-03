import 'package:audread/models/subtopic.dart';
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

  bool isContinueFromPrevAvailable = false;

  getTopic(String topicId) async {
    try {
      final topicBox = await Hive.openBox<TopicModel>('topics');
      topic = topicBox.get(topicId)!;
      topicState = TopicViewState.loaded;
      notifyListeners();
    } catch (e) {
      topicState = TopicViewState.fetchError;
      notifyListeners();
    }
  }

  Future<List<SubtopicModel>> getSubtopics() async {
    try {
      final subtopicsBox = await Hive.openBox<List<SubtopicModel>>('subtopics');
      var subtopics = subtopicsBox.get(topic.topicId)!;
      return subtopics;
    } catch (e) {
      topicState = TopicViewState.fetchError;
      notifyListeners();
      return [];
    }
  }

  void tryAgain() {
    topicState = TopicViewState.loading;
    notifyListeners();
  }
}
