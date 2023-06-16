import 'package:flutter/material.dart';
import 'package:gofit_apps/model/apis/service_api.dart';
import 'package:gofit_apps/model/level_training.dart';

class LevelProvider extends ChangeNotifier {
  final ApiGym _api = ApiGym();
  List<LevelTraining?> _level = [];
}
