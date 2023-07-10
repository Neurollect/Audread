import 'package:audread/models/topic.dart';
import 'package:hive/hive.dart';

part 'subtopic.g.dart';

@HiveType(typeId: 7)
class SubtopicModel {
  @HiveField(0)
  String subtopicId;

  @HiveField(1)
  String? subtopicName;

  @HiveField(2)
  int? subtopicNo;

  @HiveField(3)
  TopicModel? subtopicTopic;

  @HiveField(4)
  String? subtopicDescription;

  @HiveField(5)
  String? previewImage;

  SubtopicModel({
    required this.subtopicId,
    this.subtopicName,
    this.subtopicNo,
    this.subtopicTopic,
    this.subtopicDescription,
    this.previewImage,
  });

  static SubtopicModel fromJson(Map<String, dynamic> json) => SubtopicModel(
        subtopicId: json['subtopic_id'] as String,
        subtopicName: json['subtopic_name'] as String?,
        subtopicNo: json['subtopic_no'] as int?,
        subtopicTopic: TopicModel.fromJson(json['subtopic_topic']),
        subtopicDescription: json['subtopic_name'] as String?,
        previewImage: json['preview_image'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'subtopic_id': subtopicId,
        'subtopic_name': subtopicName,
        'subtopic_no': subtopicNo,
        'subtopic_subject': subtopicTopic,
        'subtopic_description': subtopicDescription,
        'preview_image': previewImage,
      };
}
