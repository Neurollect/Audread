class UserModel {
  String? id;
  String? userId;
  String? memberId;
  String? avatar;
  String? createdAt;

  UserModel({this.id, this.userId, this.memberId, this.avatar});

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        userId: json['user_id'] as String,
        memberId: json['member_id'],
        avatar: json['avatar'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'user_id': userId,
        'member_id': memberId,
        'avatar': avatar
      };
}
