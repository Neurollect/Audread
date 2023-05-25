import 'package:hive/hive.dart';
import 'academic_level.dart';
part 'genre.g.dart';

@HiveType(typeId: 8)
class GenreModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  AcademicLevelModel? genreLevel;

  GenreModel({
    required this.id,
    this.name,
    this.genreLevel,
  });

  static GenreModel fromJson(Map<String, dynamic> json) => GenreModel(
        id: json['genre_id'] as String,
        name: json['genre_name'] as String?,
        genreLevel: AcademicLevelModel.fromJson(json['genre_level']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'genre_id': id,
        'genre_name': name,
        'genre_level': genreLevel,
      };
}
