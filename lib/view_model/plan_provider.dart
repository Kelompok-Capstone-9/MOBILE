import 'package:flutter/material.dart';
import 'package:gofit_apps/model/plan.dart';

class PlanProvider extends ChangeNotifier {
  PlanData? _id;
  PlanData? get id => _id;
  PlanData? _name;
  PlanData? get name => _name;
  PlanData? _duration;
  PlanData? get duration => _duration;
  PlanData? _price;
  PlanData? get price => _price;
}
