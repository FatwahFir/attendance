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

class UserDetails {
  int? id;
  int? userId;
  String? name;
  String? phone;
  dynamic locationId;
  String? createdAt;
  String? updatedAt;
  String? address;

  UserDetails(
      {this.id,
      this.userId,
      this.name,
      this.phone,
      this.locationId,
      this.createdAt,
      this.updatedAt,
      this.address});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    locationId = json['location_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['phone'] = phone;
    data['location_id'] = locationId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['address'] = address;
    return data;
  }
}
