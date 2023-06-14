import 'dart:convert';

import 'package:gofit_apps/model/plan.dart';
import 'package:gofit_apps/model/register.dart';
import 'package:http/http.dart ' as http;

class ApiGym {
  static const String baseUrl = 'http://18.141.56.154:8000';
  static const String login = '/login';
  static const String register = '/register';
  static const String user = '/user';
  static const String plan = '/plans/all';

  /*  untuk endpoints lain-lain bisa menyusul ya, keep spirit kawan :)
      - kalau ada yang kurang, konfirmasi aja ya, PC atau di group
      - jangan lupa di LOG ya
      semangat tim uhuy ...

  */
  /*  "email" : "mobile@email.com",
     "password" : "Mobile9_"
     */

  static Future<RegisterModel> registerUser(Data data) async {
    final response = await http.post(
      Uri.parse('$baseUrl$register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data.toJson()),
    );
    if (response.statusCode == 201) {
      print(data);
      print(response.statusCode);
      return RegisterModel.fromJson(jsonDecode(response.body));
    } else {
      print(data);
      print(response.statusCode);
      throw "Can't add user";
    }
  }

  static Future<PlanModel> planUser(PlanData planData) async {
    final response = await http.get(
      Uri.parse('$baseUrl$plan'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      print(planData);
      print(response.statusCode);
      return PlanModel.fromJson(jsonDecode(response.body));
    } else {
      print(planData);
      print(response.statusCode);
      throw "Can't add plan";
    }
  }
}
