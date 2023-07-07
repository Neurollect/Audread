import 'package:audread/models/topic.dart';
import 'package:audread/repositories/topic_repository.dart';
import 'package:hive/hive.dart';

class TopicStorage implements TopicRepository {
  @override
  Future getTopicsByGenre(String genreId) async {
    final topicBox = await Hive.openBox<TopicModel>('topic_box');
    List<TopicModel> topics = [];

    for (var topic in topicBox.values) {
      if (topic.topicSubject!.genre?.id == genreId) {
        topics.add(topic);
      }
    }

    return topics;
  }

  @override
  Future<List<TopicModel>> getTopicsByGrade(String gradeId) async {
    final topicBox = await Hive.openBox<TopicModel>('topic_box');
    List<TopicModel> topics = [];

    for (var topic in topicBox.values) {
      if (topic.topicGrade!.gradeId == gradeId) {
        topics.add(topic);
      }
    }

    return topics;
  }
}
