import 'dart:convert';
import 'package:http/http.dart ' as http;
import '../plan_member.dart';

class ApiGym {
  static const String baseUrl = 'http://18.141.56.154:8000';
  static const String login = '/login';
  static const String register = '/register';
  static const String user = '/user';
  static const String plan = '/plans/all';

  Future<List<PlanMember>> getAllPlans() async {
    final response = await http.get(Uri.parse('$baseUrl$plan'));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final dataList = responseData['data'];
      return dataList
          .map<PlanMember>((data) => PlanMember.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load plans');
    }
  }
}
