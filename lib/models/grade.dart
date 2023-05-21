import 'package:hive/hive.dart';
import 'academic_level.dart';

part 'grade.g.dart';

@HiveType(typeId: 4)
class GradeModel {
  @HiveField(0)
  String gradeId;

  @HiveField(1)
  String? gradeName;

  @HiveField(2)
  AcademicLevelModel? gradeLevel;

  GradeModel({
    required this.gradeId,
    this.gradeLevel,
    this.gradeName,
  });

  static GradeModel fromJson(Map<String, dynamic> json) => GradeModel(
        gradeId: json['grade_id'] as String,
        gradeName: json['grade_name'] as String?,
        gradeLevel: AcademicLevelModel.fromJson(json['grade_level']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'genre_id': gradeId,
        'genre_name': gradeName,
        'grade_level': gradeLevel,
      };
}
