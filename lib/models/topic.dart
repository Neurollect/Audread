import 'package:hive/hive.dart';

import 'grade.dart';
import 'subject.dart';

part 'topic.g.dart';

@HiveType(typeId: 6)
class TopicModel {
  @HiveField(0)
  String topicId;

  @HiveField(1)
  String? topicName;

  @HiveField(2)
  int? topicNo;

  @HiveField(3)
  SubjectModel? topicSubject;

  @HiveField(4)
  GradeModel? topicGrade;

  @HiveField(5)
  String? topicDescription;

  @HiveField(6)
  String? previewImage;

  TopicModel({
    required this.topicId,
    this.topicName,
    this.topicNo,
    this.topicSubject,
    this.topicGrade,
    this.topicDescription,
    this.previewImage,
  });

  static TopicModel fromJson(Map<String, dynamic> json) => TopicModel(
        topicId: json['topic_id'] as String,
        topicName: json['topic_name'] as String?,
        topicNo: json['topic_no'] as int?,
        topicSubject: SubjectModel.fromJson(json['topic_subject']),
        topicGrade: GradeModel.fromJson(json['topic_level']),
        topicDescription: json['topic_description'] as String?,
        previewImage: json['preview_image'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'topic_id': topicId,
        'topic_name': topicName,
        'topic_no': topicNo,
        'topic_subject': topicSubject,
        'topic_grade': topicGrade,
        'topic_description': topicDescription,
        'preview_image': previewImage,
      };
}
