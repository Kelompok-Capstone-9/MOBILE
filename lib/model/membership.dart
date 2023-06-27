import 'dart:convert';
import 'package:gofit_apps/model/plan_member.dart';
import 'login.dart';

class MemberModel {
  MemberModelMetadata? metadata;
  DataMember? data;

  MemberModel({
    this.metadata,
    this.data,
  });

  factory MemberModel.fromRawJson(String str) =>
      MemberModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
        metadata: json["metadata"] == null
            ? null
            : MemberModelMetadata.fromJson(json["metadata"]),
        data: json["data"] == null ? null : DataMember.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "data": data?.toJson(),
      };
}

class DataMember {
  int? id;
  UserLogin? user;
  PlanMember? plan;
  DateTime? startDate;
  DateTime? endDate;
  bool? is_active;
  DataMetadata? metadata;

  DataMember({
    this.id,
    this.user,
    this.plan,
    this.startDate,
    this.endDate,
    this.is_active,
    this.metadata,
  });

  factory DataMember.fromRawJson(String str) =>
      DataMember.fromJson(json.decode(str));

  get isMember => null;

  String toRawJson() => json.encode(toJson());

  factory DataMember.fromJson(Map<String, dynamic> json) => DataMember(
        id: json["id"],
        user: json["user"] == null ? null : UserLogin.fromJson(json["user"]),
        plan: json["plan"] == null ? null : PlanMember.fromJson(json["plan"]),
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        is_active: json["is_active"],
        metadata: json["metadata"] == null
            ? null
            : DataMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "plan": plan?.toJson(),
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "is_active": is_active,
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

class MemberModelMetadata {
  int? statusCode;
  String? message;
  String? errorReason;

  MemberModelMetadata({
    this.statusCode,
    this.message,
    this.errorReason,
  });

  factory MemberModelMetadata.fromRawJson(String str) =>
      MemberModelMetadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MemberModelMetadata.fromJson(Map<String, dynamic> json) =>
      MemberModelMetadata(
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
