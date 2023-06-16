import 'dart:convert';

import 'package:gofit_apps/model/plan.dart';
import 'package:gofit_apps/model/register.dart';
import 'dart:developer';
import 'package:http/http.dart ' as http;

class ApiGym {
  static const String baseUrl = 'http://18.141.56.154:8000';
  static const String login = '/login';
  static const String register = '/register';
  static const String user = '/user';
  static const String plan = '/plans/all';
  static const String joinMember = '/memberships/join/';
  static const String apiLevel = 'https://62f827a6ab9f1f8e89087245.mockapi.io/level_training';

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
      headers: {
        'Content-Type': 'application/json',
      },
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

  static Future joinMembership({int? idPlan, String? token}) async {
    log('id plan terpilih $idPlan');
    final response = await http.post(
      Uri.parse('$baseUrl$joinMember$idPlan'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },

      // body: null,
    );
    print(response.statusCode);

    if (response.statusCode == 201) {
      print("success daftar plan id $idPlan");
      // var responData = response.statusCode == 201;
      return response.statusCode;
    } else {
      print(response.statusCode);
      throw "Can't add plan";
    }

    // throw "Can't add plan";
  }

  static Future<PlanData> planUser() async {
    final response = await http.get(
      Uri.parse('$baseUrl$plan'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      print("planData");
      print(response.statusCode);
      return PlanData.fromJson(jsonDecode(response.body));
    } else {
      // print(planData);
      print(response.statusCode);
      throw "Can't add plan";
    }
  }

  Future<List<PlanData>> getAllPlans() async {
    print("service ok");

    final response = await http.get(Uri.parse('$baseUrl$plan'));

    print(response.statusCode);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final dataList = responseData['data'];
      return dataList.map<PlanData>((data) => PlanData.fromJson(data)).toList();
    } else {
      throw Exception('Gagal load plans');
    }
  }

  static Future loginUsers(uname, upass) async {
    final url = Uri.parse('$baseUrl$login');
    final Map<String, dynamic> requestBody = {
      "email": uname,
      "password": upass
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      log(responseData.toString());
      return responseData;
    } else {
      print('Failed to login');
      print('Status Code: ${response.statusCode}');
      log(response.body);
      throw "Can't get the data";
    }
  }


}
