import 'package:flutter/material.dart';
import 'package:gofit_apps/model/apis/service_api.dart';
import 'package:gofit_apps/model/level_training.dart';

class LevelProvider extends ChangeNotifier {
  final ApiGym apiLevel = ApiGym();
  List<LevelTraining?> _level = [];
  List<LevelTraining?> get level => _level;
  bool isLoading = false;
  String error = '';

  Future<void> fetchLevelUser() async {
    try {
      _level = await apiLevel.getLevelUser();

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
