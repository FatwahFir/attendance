class Attendance {
  int? id;
  int? userId;
  String? lat;
  String? long;
  String? createdAt;
  String? updatedAt;
  String? type;

  Attendance(
      {this.id,
      this.userId,
      this.lat,
      this.long,
      this.createdAt,
      this.updatedAt,
      this.type});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    lat = json['lat'];
    long = json['long'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['lat'] = lat;
    data['long'] = long;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['type'] = type;
    return data;
  }
}
