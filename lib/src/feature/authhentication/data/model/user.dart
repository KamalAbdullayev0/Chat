import 'package:chat/src/feature/authhentication/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.supertokensId,
    required super.username,
    required super.email,
    required super.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      supertokensId: json['supertokens_id'],
      username: json['username'],
      email: json['email'],
      avatarUrl: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'supertokens_id': supertokensId,
      'username': username,
      'email': email,
      'avatar_url': avatarUrl,
    };
  }
}
