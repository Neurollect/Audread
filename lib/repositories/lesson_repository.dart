library lesson;

abstract class LessonRepository {
  Future getLesson(
    String id,
  );

  Future getSubtopicLessons(
    String subtopicId,
  );
}
