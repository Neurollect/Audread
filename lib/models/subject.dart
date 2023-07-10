import 'package:hive/hive.dart';
import 'academic_level.dart';
import 'genre.dart';

part 'subject.g.dart';

@HiveType(typeId: 5)
class SubjectModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  AcademicLevelModel? level;

  @HiveField(3)
  GenreModel? genre;

  @HiveField(4)
  String? previewImage;

  SubjectModel({
    required this.id,
    this.name,
    this.genre,
    this.level,
    this.previewImage,
  });

  static SubjectModel fromJson(Map<String, dynamic> json) => SubjectModel(
        id: json['subject_id'] as String,
        name: json['subject_name'] as String?,
        level: AcademicLevelModel.fromJson(json['subject_level']),
        genre: GenreModel.fromJson(
          json['subject_genre'],
        ),
        previewImage: json['preview_image'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'subject_id': id,
        'subject_name': name,
        'subject_level': level,
        'subject_genre': genre,
        'preview_image': previewImage,
      };
}
