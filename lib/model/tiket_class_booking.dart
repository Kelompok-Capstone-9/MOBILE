// To parse this JSON data, do
//
//     final bookingClass = bookingClassFromJson(jsonString);

import 'dart:convert';

BookingClassById bookingClassFromJson(String str) =>
    BookingClassById.fromJson(json.decode(str));

String bookingClassToJson(BookingClassById data) => json.encode(data.toJson());

class BookingClassById {
  BookingClassMetadata metadata;
  ClassTiketById data;

  BookingClassById({
    required this.metadata,
    required this.data,
  });

  factory BookingClassById.fromJson(Map<String, dynamic> json) =>
      BookingClassById(
        metadata: BookingClassMetadata.fromJson(json["metadata"]),
        data: ClassTiketById.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata.toJson(),
        "data": data.toJson(),
      };
}

class ClassTiketById {
  int id;
  User user;
  ClassPackageById classPackage;
  String status;
  LocationMetadata metadata;

  ClassTiketById({
    required this.id,
    required this.user,
    required this.classPackage,
    required this.status,
    required this.metadata,
  });

  factory ClassTiketById.fromJson(Map<String, dynamic> json) => ClassTiketById(
        id: json["id"],
        user: User.fromJson(json["user"]),
        classPackage: ClassPackageById.fromJson(json["class_package"]),
        status: json["status"],
        metadata: LocationMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "class_package": classPackage.toJson(),
        "status": status,
        "metadata": metadata.toJson(),
      };
}

class ClassPackageById {
  int id;
  String period;
  int price;
  Class classPackageClass;
  LocationMetadata metadata;

  ClassPackageById({
    required this.id,
    required this.period,
    required this.price,
    required this.classPackageClass,
    required this.metadata,
  });

  factory ClassPackageById.fromJson(Map<String, dynamic> json) =>
      ClassPackageById(
        id: json["id"],
        period: json["period"],
        price: json["price"],
        classPackageClass: Class.fromJson(json["class"]),
        metadata: LocationMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "period": period,
        "price": price,
        "class": classPackageClass.toJson(),
        "metadata": metadata.toJson(),
      };
}

class Class {
  int id;
  String name;
  String description;
  String classType;
  String link;
  DateTime startedAt;
  Location location;
  String imageBanner;
  LocationMetadata metadata;

  Class({
    required this.id,
    required this.name,
    required this.description,
    required this.classType,
    required this.link,
    required this.startedAt,
    required this.location,
    required this.imageBanner,
    required this.metadata,
  });

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        classType: json["class_type"],
        link: json["link"],
        startedAt: DateTime.parse(json["started_at"]),
        location: Location.fromJson(json["location"]),
        imageBanner: json["image_banner"],
        metadata: LocationMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "class_type": classType,
        "link": link,
        "started_at": startedAt.toIso8601String(),
        "location": location.toJson(),
        "image_banner": imageBanner,
        "metadata": metadata.toJson(),
      };
}

class Location {
  int id;
  String name;
  String address;
  String city;
  String latitude;
  String longitude;
  LocationMetadata metadata;

  Location({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.metadata,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        city: json["city"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        metadata: LocationMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "city": city,
        "latitude": latitude,
        "longitude": longitude,
        "metadata": metadata.toJson(),
      };
}

class LocationMetadata {
  DateTime createdAt;
  DateTime updatedAt;

  LocationMetadata({
    required this.createdAt,
    required this.updatedAt,
  });

  factory LocationMetadata.fromJson(Map<String, dynamic> json) =>
      LocationMetadata(
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class User {
  int id;
  String name;
  String email;
  String password;
  String gender;
  int height;
  int goalHeight;
  int weight;
  int goalWeight;
  String trainingLevel;
  String profilePicture;
  LocationMetadata metadata;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.height,
    required this.goalHeight,
    required this.weight,
    required this.goalWeight,
    required this.trainingLevel,
    required this.profilePicture,
    required this.metadata,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        gender: json["gender"],
        height: json["height"],
        goalHeight: json["goal_height"],
        weight: json["weight"],
        goalWeight: json["goal_weight"],
        trainingLevel: json["training_level"],
        profilePicture: json["profile_picture"],
        metadata: LocationMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "gender": gender,
        "height": height,
        "goal_height": goalHeight,
        "weight": weight,
        "goal_weight": goalWeight,
        "training_level": trainingLevel,
        "profile_picture": profilePicture,
        "metadata": metadata.toJson(),
      };
}

class BookingClassMetadata {
  int statusCode;
  String message;
  String errorReason;

  BookingClassMetadata({
    required this.statusCode,
    required this.message,
    required this.errorReason,
  });

  factory BookingClassMetadata.fromJson(Map<String, dynamic> json) =>
      BookingClassMetadata(
        statusCode: json["status_code"],
        message: json["message"],
        errorReason: json["error_reason"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "error_reason": errorReason,
      };
}
