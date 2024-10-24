import 'package:attendance/app/data/models/location_model.dart';

class UserDetails {
  int? id;
  int? userId;
  String? name;
  String? phone;
  dynamic locationId;
  String? createdAt;
  String? updatedAt;
  String? address;
  Location? location;

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
    location =
        json['location'] != null ? Location?.fromJson(json['location']) : null;
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
    if (location != null) {
      data['location'] = location?.toJson();
    }
    return data;
  }
}
