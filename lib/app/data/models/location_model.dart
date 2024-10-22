class Location {
  int? id;
  int? adminId;
  String? lat;
  String? long;
  String? createdAt;
  String? updatedAt;
  String? name;
  int? maxRadius;

  Location(
      {this.id,
      this.adminId,
      this.lat,
      this.long,
      this.createdAt,
      this.updatedAt,
      this.name});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    lat = json['lat'];
    long = json['long'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    maxRadius = json['max_radius'] as int;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['admin_id'] = adminId;
    data['lat'] = lat;
    data['long'] = long;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['max_radius'] = maxRadius;
    return data;
  }
}
