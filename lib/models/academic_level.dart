import 'package:hive/hive.dart';
part 'academic_level.g.dart';

@HiveType(typeId: 3)
class AcademicLevelModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String? name;

  AcademicLevelModel({
    required this.id,
    this.name,
  });

  static AcademicLevelModel fromJson(Map<String, dynamic> json) =>
      AcademicLevelModel(
        id: json['genre_id'] as String,
        name: json['genre_name'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'genre_id': id,
        'genre_name': name,
      };
}
