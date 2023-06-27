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
      nameLevel: json["name_level"],
      description: json["description"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "name_level": nameLevel, "description": description};
}
