import 'package:flutter/material.dart';
import 'package:gofit_apps/model/level_training.dart';

class LevelProvider extends ChangeNotifier {
  String? _id;
  String? get id => _id;
  String? _nameLevel;
  String? get nameLevel => _nameLevel;
  String? _desc;
  String? get description => _desc;

  void getLevelUser({String? id, String? nameLevel, String? description}) {
    _id = id;
    _nameLevel = nameLevel;
    _desc = description;

    notifyListeners();
    print(id);
    print(nameLevel);
    print(description);
  }
}
