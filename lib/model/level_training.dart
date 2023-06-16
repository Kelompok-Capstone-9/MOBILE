import 'dart:convert';

class LevelTraining {
  String? id;
  String? nameLevel;
  String? description;

  LevelTraining({
    this.id,
    this.nameLevel,
    this.description,
  });

  factory LevelTraining.fromRawJson(String str) =>
      LevelTraining.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LevelTraining.fromJson(Map<String, dynamic> json) => LevelTraining(
      id: json["id"],
      nameLevel: json["nameLevel"],
      description: json["description"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "nameLevel": nameLevel, "description": description};
}
