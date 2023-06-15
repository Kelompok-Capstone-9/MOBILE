import 'package:flutter/material.dart';
import 'package:gofit_apps/model/plan.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class PlanProvider extends ChangeNotifier {
  PlanData? _id;
  PlanData? get id => _id;
  PlanData? _name;
  PlanData? get name => _name;
  PlanData? _desc;
  PlanData? get desc => _desc;
  PlanData? _duration;
  PlanData? get duration => _duration;
  PlanData? _price;
  PlanData? get price => _price;

  void getPlanUser({PlanData? id, PlanData? name, PlanData? duration}) {
    _id = id;
    _name = name;
    _duration = duration;

    notifyListeners();
    print(id!.id);
    print(name!.name);
  }
}
