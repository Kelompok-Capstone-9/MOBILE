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
    factory PlanModel.fromRawJson(String str) => PlanModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PlanModel.fromJson(Map json) => PlanModel(
        metadata: json["metadata"] == null ? null : PlanModelMetadata.fromJson(json["metadata"]),
        planData: json["planData"] == null ? null : PlanData.fromJson(json["planData"]),
    );

    Map<String, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "plaData": planData?.toJson(),
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
  
    

}

class PlanDataMetadata {
    String? createdAt;
    String? updatedAt;

    PlanDataMetadata({
        this.createdAt,
        this.updatedAt,
    });

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

}
