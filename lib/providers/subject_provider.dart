import 'package:audread/models/subject.dart';
import 'package:audread/models/topic.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum SubjectState {
  loading,
  loaded,
  fetchError,
}

class SubjectProvider with ChangeNotifier {
  SubjectState topicState = SubjectState.loading;

  SubjectModel subject = SubjectModel(
    id: '',
  );

  bool isContinueFromPrevAvailable = false;

  getTopics() async {
    try {
      final topicBox = await Hive.openBox<List<TopicModel>>('topics');
      var topics = topicBox.get('topic')!;
      return topics;
    } catch (e) {
      topicState = SubjectState.fetchError;
      notifyListeners();
    }
  }

  void tryAgain() {
    topicState = SubjectState.loading;
    notifyListeners();
  }
}
