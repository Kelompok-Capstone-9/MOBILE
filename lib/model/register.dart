/*    @Risdy : isi aja sesuai arahan kemarin
        untuk sementara nama modelsnya ini dulu, biar bisa 
        sama sama asynchronuz sama branch register.

        kalau ada salah/kurang tepat, perbaikin and confirm aja .
        semangat :)
        
*/
import 'dart:convert';

class RegisterModel {
    RegisterModelMetadata? metadata;
    Data? data;

    RegisterModel({
        this.metadata,
        this.data,
    });

    factory RegisterModel.fromRawJson(String str) => RegisterModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        metadata: json["metadata"] == null ? null : RegisterModelMetadata.fromJson(json["metadata"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "data": data?.toJson(),
    };
}

class Data {
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

    Data({
        this.id,
        this.name,
        this.email,
        this.password,
        this.gender,
        this.height,
        this.goalHeight,
        this.weight,
        this.goalWeight,
        this.metadata,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        gender: json["gender"],
        height: json["height"],
        goalHeight: json["goal_height"],
        weight: json["weight"],
        goalWeight: json["goal_weight"],
        metadata: json["metadata"] == null ? null : DataMetadata.fromJson(json["metadata"]),
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

    factory DataMetadata.fromRawJson(String str) => DataMetadata.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DataMetadata.fromJson(Map<String, dynamic> json) => DataMetadata(
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class RegisterModelMetadata {
    int? statusCode;
    String? message;
    String? errorReason;

    RegisterModelMetadata({
        this.statusCode,
        this.message,
        this.errorReason,
    });

    factory RegisterModelMetadata.fromRawJson(String str) => RegisterModelMetadata.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RegisterModelMetadata.fromJson(Map<String, dynamic> json) => RegisterModelMetadata(
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
