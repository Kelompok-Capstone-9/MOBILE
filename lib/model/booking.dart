import 'dart:convert';

Classes classesFromJson(String str) => Classes.fromJson(json.decode(str));

String classesToJson(Classes data) => json.encode(data.toJson());

class Classes {
  ClassesMetadata metadata;
  Pagination pagination;
  List<DataClass> data;

  Classes({
    required this.metadata,
    required this.pagination,
    required this.data,
  });

  factory Classes.fromJson(Map<String, dynamic> json) => Classes(
        metadata: ClassesMetadata.fromJson(json["metadata"]),
        pagination: Pagination.fromJson(json["pagination"]),
        data: List<DataClass>.from(
            json["data"].map((x) => DataClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata.toJson(),
        "pagination": pagination.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataClass {
  int id;
  String name;
  String description;
  String classType;
  String link;
  DateTime startedAt;
  List<ClassPackage> classPackages;
  Location location;
  ClassPackageMetadata metadata;

  DataClass({
    required this.id,
    required this.name,
    required this.description,
    required this.classType,
    required this.link,
    required this.startedAt,
    required this.classPackages,
    required this.location,
    required this.metadata,
  });

  factory DataClass.fromJson(Map<String, dynamic> json) => DataClass(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        classType: json["class_type"],
        link: json["link"],
        startedAt: DateTime.parse(json["started_at"]),
        classPackages: List<ClassPackage>.from(
            json["class_packages"].map((x) => ClassPackage.fromJson(x))),
        location: Location.fromJson(json["location"]),
        metadata: ClassPackageMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "class_type": classType,
        "link": link,
        "started_at": startedAt.toIso8601String(),
        "class_packages":
            List<dynamic>.from(classPackages.map((x) => x.toJson())),
        "location": location.toJson(),
        "metadata": metadata.toJson(),
      };
}

class ClassPackage {
  int? id;
  String? period;
  int? price;
  int? classId;
  String? status;
  ClassPackageMetadata? metadata;

  ClassPackage({
    this.id,
    this.period,
    this.price,
    this.classId,
    this.status,
    this.metadata,
  });

  factory ClassPackage.fromJson(Map<String, dynamic> json) => ClassPackage(
        id: json["id"],
        period: json["period"],
        price: json["price"],
        classId: json["class_id"],
        status: json["status"] ?? "false",
        metadata: ClassPackageMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "period": period,
        "price": price,
        "class_id": classId,
        "status": status ?? "false",
        "metadata": metadata?.toJson(),
      };
}

class ClassPackageMetadata {
  DateTime createdAt;
  DateTime updatedAt;

  ClassPackageMetadata({
    required this.createdAt,
    required this.updatedAt,
  });

  factory ClassPackageMetadata.fromJson(Map<String, dynamic> json) =>
      ClassPackageMetadata(
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Location {
  int id;
  String name;
  String address;
  String city;
  String latitude;
  String longitude;
  ClassPackageMetadata metadata;

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
        metadata: ClassPackageMetadata.fromJson(json["metadata"]),
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

class ClassesMetadata {
  int statusCode;
  String message;
  String errorReason;

  ClassesMetadata({
    required this.statusCode,
    required this.message,
    required this.errorReason,
  });

  factory ClassesMetadata.fromJson(Map<String, dynamic> json) =>
      ClassesMetadata(
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

class Pagination {
  int page;
  int dataShown;
  int totalData;

  Pagination({
    required this.page,
    required this.dataShown,
    required this.totalData,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        dataShown: json["data_shown"],
        totalData: json["total_data"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "data_shown": dataShown,
        "total_data": totalData,
      };
}
