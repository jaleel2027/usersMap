import 'dart:convert';

MapsModel mapsModelFromJson(String str) => MapsModel.fromJson(json.decode(str));

String mapsModelToJson(MapsModel data) => json.encode(data.toJson());

class MapsModel {
  MapsModel({
    required this.success,
    required this.location,
  });

  List<Success> success;
  List<Location> location;

  factory MapsModel.fromJson(Map<String, dynamic> json) => MapsModel(
    success: List<Success>.from(json["success"].map((x) => Success.fromJson(x))),
    location: List<Location>.from(json["location"].map((x) => Location.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": List<dynamic>.from(success.map((x) => x.toJson())),
    "location": List<dynamic>.from(location.map((x) => x.toJson())),
  };
}

class Location {
  Location({
    required this.lat,
    required this.long,
  });

  String lat;
  String long;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
  };
}

class Success {
  Success({
    required this.name,
    required this.email,
    required this.createdAt,
  });

  String name;
  String email;
  DateTime createdAt;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
    name: json["name"],
    email: json["email"],
    createdAt: json["created_at"]!);

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
  };
}
