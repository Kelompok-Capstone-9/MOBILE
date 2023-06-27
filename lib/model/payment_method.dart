// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Payment {
  String? id;
  String? type;
  String? desc;
  String? image;

  Payment({
    this.id,
    this.type,
    this.desc,
    this.image,
  });

  factory Payment.fromRawJson(String str) => Payment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payment.fromJson(Map<String, dynamic> json) =>
      Payment(id: json["id"], type: json["type"], desc: json["description"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "type": type, "description": desc};
}
