import 'package:hive/hive.dart';
import 'subtopic.dart';

part 'lesson.g.dart';

@HiveType(typeId: 9)
class LessonModel {
  @HiveField(0)
  String lessonId;

  @HiveField(1)
  int? lessonNo;

  @HiveField(2)
  Map<String, dynamic>? lessonBody;

  @HiveField(3)
  SubtopicModel? lessonSubtopic;

  @HiveField(4)
  String? lessonDescription;

  @HiveField(5)
  String? lessonTitle;

  LessonModel({
    required this.lessonId,
    this.lessonTitle,
    this.lessonBody,
    this.lessonNo,
    this.lessonSubtopic,
    this.lessonDescription,
  });

  static LessonModel fromJson(Map<String, dynamic> json) => LessonModel(
        lessonId: json['lesson_id'] as String,
        lessonTitle: json['lesson_title'] as String?,
        lessonBody: json['lesson_body'],
        lessonNo: json['lesson_no'] as int?,
        lessonSubtopic: SubtopicModel.fromJson(json['lesson_subtopic']),
        lessonDescription: json['lesson_name'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'lesson_id': lessonId,
        'lesson_title': lessonTitle,
        'lesson_body': lessonBody,
        'lesson_no': lessonNo,
        'lesson_subtopic': lessonSubtopic,
        'lesson_description': lessonDescription,
      };
}
