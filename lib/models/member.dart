import 'package:hive/hive.dart';
part 'member.g.dart';

@HiveType(typeId: 2)
class MemberModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  int? avatar;

  @HiveField(2)
  String? firstName;

  @HiveField(3)
  String? lastName;

  @HiveField(4)
  String? gender;

  @HiveField(5)
  String? grade;

  @HiveField(6)
  String? organization;

  @HiveField(7)
  String? dateJoined;

  MemberModel({
    required this.id,
    this.avatar,
    this.firstName,
    this.lastName,
    this.gender,
    this.grade,
    this.organization,
    this.dateJoined,
  });

  static MemberModel fromJson(Map<String, dynamic> json) => MemberModel(
        id: json['member_id'] as String,
        avatar: json['avatar'] as int?,
        firstName: json['member_first_name'] as String?,
        lastName: json['member_last_name'] as String?,
        gender: json['member_middle_name'] as String?,
        grade: json['member_registration_number'] as String?,
        organization: json['member_organization'] as String?,
        dateJoined: json['date_joined'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'member_id': id,
        'avatar': avatar,
        'member_first_name': firstName,
        'member_last_name': lastName,
        'member_registration_number': gender,
        'member_home_phone': grade,
        'member_organization': organization,
        'date_joined': dateJoined,
      };
}
