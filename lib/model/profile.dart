import 'dart:convert';

class PlanModel {
  PlanModelMetadata? metadata;
  Pagination? pagination;
  List<PlanMember>? data;

  PlanModel({
    this.metadata,
    this.pagination,
    this.data,
  });

  factory PlanModel.fromRawJson(String str) =>
      PlanModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlanModel.fromJson(Map<String, dynamic> json) => PlanModel(
        metadata: json["metadata"] == null
            ? null
            : PlanModelMetadata.fromJson(json["metadata"]),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null
            ? []
            : List<PlanMember>.from(
                json["data"]!.map((x) => PlanMember.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "pagination": pagination?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PlanMember {
  int? id;
  String? name;
  int? duration;
  int? price;
  DatumMetadata? metadata;

  PlanMember({
    this.id,
    this.name,
    this.duration,
    this.price,
    this.metadata,
  });

  factory PlanMember.fromRawJson(String str) =>
      PlanMember.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlanMember.fromJson(Map<String, dynamic> json) => PlanMember(
        id: json["id"],
        name: json["name"],
        duration: json["duration"],
        price: json["price"],
        metadata: json["metadata"] == null
            ? null
            : DatumMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "duration": duration,
        "price": price,
        "metadata": metadata?.toJson(),
      };
}

class DatumMetadata {
  String? createdAt;
  String? updatedAt;

  DatumMetadata({
    this.createdAt,
    this.updatedAt,
  });

  factory DatumMetadata.fromRawJson(String str) =>
      DatumMetadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DatumMetadata.fromJson(Map<String, dynamic> json) => DatumMetadata(
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "updated_at": updatedAt,
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

  factory PlanModelMetadata.fromRawJson(String str) =>
      PlanModelMetadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlanModelMetadata.fromJson(Map<String, dynamic> json) =>
      PlanModelMetadata(
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
        dataShown: json["data_shown"],
        totalData: json["total_data"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "data_shown": dataShown,
        "total_data": totalData,
      };
}
