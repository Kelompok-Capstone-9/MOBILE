import 'dart:convert';

class UserModel {
  UserModelMetadata? metadata;
  UserLogin? data;
  String? token;

  UserModel({
    this.metadata,
    this.data,
    this.token,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        metadata: json["metadata"] == null
            ? null
            : UserModelMetadata.fromJson(json["metadata"]),
        data: json["data"] == null ? null : UserLogin.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "data": data?.toJson(),
        "token": token,
      };
}

class UserLogin {
  int? id;
  String? name;
  String? email;
  String? password;
  String? gender;
  int? height;
  int? goalHeight;
  int? weight;
  int? goalWeight;
  DataMetadata? metadata;

  UserLogin({
    required this.id,
    this.name,
    required this.email,
    required this.password,
    this.gender,
    this.height,
    this.goalHeight,
    this.weight,
    this.goalWeight,
    this.metadata,
  });

  factory UserLogin.fromRawJson(String str) =>
      UserLogin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        gender: json["gender"],
        height: json["height"],
        goalHeight: json["goal_height"],
        weight: json["weight"],
        goalWeight: json["goal_weight"],
        metadata: json["metadata"] == null
            ? null
            : DataMetadata.fromJson(json["metadata"]),
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
        "metadata": metadata?.toJson(),
      };
}

class DataMetadata {
  DateTime? createdAt;
  DateTime? updatedAt;

  DataMetadata({
    this.createdAt,
    this.updatedAt,
  });

  factory DataMetadata.fromRawJson(String str) =>
      DataMetadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataMetadata.fromJson(Map<String, dynamic> json) => DataMetadata(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class UserModelMetadata {
  int? statusCode;
  String? message;
  String? errorReason;

  UserModelMetadata({
    this.statusCode,
    this.message,
    this.errorReason,
  });

  factory UserModelMetadata.fromRawJson(String str) =>
      UserModelMetadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModelMetadata.fromJson(Map<String, dynamic> json) =>
      UserModelMetadata(
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
