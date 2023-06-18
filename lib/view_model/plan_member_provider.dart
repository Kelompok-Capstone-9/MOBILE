import 'package:flutter/material.dart';
import 'package:gofit_apps/model/apis/service_api.dart';
import '../model/plan_member.dart';

class PlanProvider extends ChangeNotifier {
  final ApiGym _api = ApiGym();
  List<PlanMember?> _planMember = [];
  List<PlanMember?> get planMember => _planMember;
  bool isLoading = false;
  String error = '';

  Future<void> fetchDataPlan() async {
    try {
      _planMember = await _api.getAllPlans();

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
