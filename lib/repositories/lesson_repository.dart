library lesson;

abstract class LessonRepository {
  Future getLesson(
    String id,
  );

  Future getLessons(
    String subtopicId,
  );
}
