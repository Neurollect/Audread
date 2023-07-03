import 'package:audread/models/lesson.dart';
import 'package:audread/repositories/lesson_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive/hive.dart';

class SupabaseLessonServices implements LessonRepository {
  final SupabaseClient _supabaseClient;
  const SupabaseLessonServices(this._supabaseClient);

  @override
  Future getLesson(String id) async {
    final lessonBox = await Hive.openBox<LessonModel>('lesson_box');
    try {
      final response = await _supabaseClient
          .from('lessons')
          .select('*')
          .eq('lesson_id', id)
          .single();

      final lesson = LessonModel.fromJson(response);
      Future.wait([
        lessonBox.put(id, lesson),
      ]);

      return lesson;
    } catch (err) {
      //Other Errors
      return err;
    }
  }

  @override
  Future getSubtopicLessons(String subtopicId) async {
    try {
      final response = await _supabaseClient
          .from('lessons')
          .select('*')
          .eq('subtopic_id', subtopicId);

      final lessons = response.map((lesson) => LessonModel.fromJson(lesson));

      Future.wait([addLessonsToLocalStorage(lessons)]);

      return lessons;
    } catch (err) {
      //Other Errors
      return err;
    }
  }

  Future addLessonsToLocalStorage(lessons) async {
    final lessonBox = await Hive.openBox<LessonModel>('lesson_box');
    for (LessonModel lesson in lessons) {
      await lessonBox.put(lesson.lessonId, lesson);
    }
  }
}
