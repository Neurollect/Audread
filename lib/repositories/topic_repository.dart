library topic;

abstract class TopicRepository {
  Future getTopicsByGrade(
    String gradeId,
  );

  Future getTopicsByGenre(
    String genreId,
  );
}
