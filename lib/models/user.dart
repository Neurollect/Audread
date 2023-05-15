import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? userId;

  @HiveField(2)
  String? memberId;

  @HiveField(3)
  String? createdAt;

  @HiveField(4)
  bool? isNewUser;

  UserModel(
      {this.id, this.userId, this.memberId, this.isNewUser, this.createdAt});

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        userId: json['user_id'] as String,
        memberId: json['member_id'],
        isNewUser: json['is_new_user'],
        createdAt: json['created_at'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'user_id': userId,
        'member_id': memberId,
        'is_new_user': isNewUser,
        'created_at': createdAt,
      };
}
