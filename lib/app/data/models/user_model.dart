import 'package:attendance/app/data/models/user_detail_model.dart';

class User {
  int? id;
  String? username;
  String? role;
  String? createdAt;
  String? updatedAt;
  UserDetails? userDetails;

  User(
      {this.id,
      this.username,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.userDetails});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userDetails = json['user_details'] != null
        ? UserDetails?.fromJson(json['user_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (userDetails != null) {
      data['user_details'] = userDetails?.toJson();
    }
    return data;
  }
}
