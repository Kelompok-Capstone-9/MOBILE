import 'dart:convert';

class PlanModel {
  PlanModelMetadata? metadata;
  Pagination? pagination;
  List<PlanData>? planData;

  PlanModel({
    this.metadata,
    this.pagination,
    this.planData,
  });

  factory PlanModel.fromRawJson(String str) =>
      PlanModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlanModel.fromJson(Map<String, dynamic> json) => PlanModel(
        metadata: json["metadata"] == null
            ? null
            : PlanModelMetadata.fromJson(json["metadata"]),
        planData: json["planData"] == null
            ? null
            : List<PlanData>.from(
                json["planData"].map((x) => PlanData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "planData": planData != null
            ? List<dynamic>.from(planData!.map((x) => x.toJson()))
            : null,
      };
}


class PlanData {
  int? id;
  String? name;
  int? duration;
  int? price;
  PlanData? metadata;

  PlanData({
    this.id,
    this.name,
    this.duration,
    this.price,
    this.metadata,
  });

  factory PlanData.fromRawJson(String str) =>
      PlanData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlanData.fromJson(Map<String, dynamic> json) => PlanData(
        id: json["id"],
        name: json["name"],
        duration: json["duration"],
        price: json["price"],
        metadata: json["metadata"] == null
            ? null
            : PlanData.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "duration": duration,
        "price": price,
        "metadata": metadata?.toJson(),
      };
}

class PlanDataMetadata {
  String? createdAt;
  String? updatedAt;

  PlanDataMetadata({
    this.createdAt,
    this.updatedAt,
  });

  factory PlanDataMetadata.fromRawJson(String str) =>
      PlanDataMetadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlanDataMetadata.fromJson(Map<String, dynamic> json) =>
      PlanDataMetadata(
        createdAt: json["createdAt"] == null
            ? null
            : json["createdAt"] as String,
        updatedAt: json["updatedAt"] == null
            ? null
            : json["updatedAt"] as String,
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}


class PlanModelMetadata {
  int? statusCode;
  String? message;
  String? errorReason;

  PlanModelMetadata({
    this.statusCode,
    this.message,
    this.errorReason,
  });

  factory PlanModelMetadata.fromRawJson(String str) => PlanModelMetadata.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PlanModelMetadata.fromJson(Map<String, dynamic> json) => PlanModelMetadata(
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
  int? page;
  int? dataShown;
  int? totalData;

  Pagination({
    this.page,
    this.dataShown,
    this.totalData,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        dataShown: json["dataShown"],
        totalData: json["totalData"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "dataShown": dataShown,
        "totalData": totalData,
      };
}
