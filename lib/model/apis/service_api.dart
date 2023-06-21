import 'dart:convert';

import 'package:gofit_apps/model/level_training.dart';
import 'package:gofit_apps/model/plan.dart';
import 'package:gofit_apps/model/plan_member.dart';
import 'package:gofit_apps/model/register.dart';
import 'package:gofit_apps/model/news_letter.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../booking.dart';

class ApiGym {
  static const String baseUrl = 'http://18.141.56.154:8000';
  static const String login = '/login';
  static const String register = '/register';
  static const String user = '/users';
  static const String plan = '/plans/all';
  static const String joinMember = '/memberships/join/';
  static const String apiLevel =
      'https://62f827a6ab9f1f8e89087245.mockapi.io/level_training';
  static const String apiNews =
      'https://648cad3e8620b8bae7ed3c9b.mockapi.io/health_tips';

  static const String bookingDetail = 'classes';

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

  Future<List<PlanData>> getAllPlansJoin() async {
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

  Future<List<LevelTraining>> getLevelUser() async {
    print("service ok");

    final response = await http.get(Uri.parse(apiLevel));

    print(response.statusCode);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      // final level = responseData['level'];
      final level = responseData;
      print(level);

      return level
          .map<LevelTraining>((level) => LevelTraining.fromJson(level))
          .toList();
    } else {
      throw Exception('Gagal load level');
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

  static Future<Map<String, dynamic>> detailBooking(
      {int? id, String? token}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$bookingDetail/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      print(response.body);
      return responseData;
    } else {
      // print(planData);
      print(response.statusCode);
      throw "Can't get dataclass";
    }
  }

  Future sendOTP(email, otp) async {
    log(email);

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const servisId = 'service_gyix20h';
    const userId = 'kgBftW4780LNwN4e2';

    final response = await http.post(url,
        headers: {
          'content-type': 'application/json',
          'origin': 'http://localhost'
        },
        body: json.encode({
          'service_id': servisId,
          'template_id': 'template_kft1yri',
          'user_id': userId,
          'template_params': {
            'name': "Hallo, ${email.toString()}",
            'subject': 'gofit',
            'to_email': email.toString(),
            'reply_to': email.toString(),
            'message': "this your otp ${otp.toString()}",
          }
        }));
    print(response);
    return response.statusCode;
  }

  Future<List<NewsLetter>> getNewsLetter() async {
    final url = Uri.parse(apiNews);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final artikel = json.decode(response.body);
        return artikel
            .map<NewsLetter>((artikel) => NewsLetter.fromJson(artikel))
            .toList();
      } else {
        throw Exception('Failed to fetch news letters.');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server.');
    }
  }

  static Future<Map<String, dynamic>> updateUser(
    int id,
    String newName,
    String token,
    String newPw,
    String newGender,
    int newHeight,
    int newWeight,
    int newGoalWeight,
    String newLevel,
    //String newPicture,
  ) async {
    final url = Uri.parse('$baseUrl$user/$id');
    final Map<String, dynamic> requestBody = {
      "name": newName,
      "password": newPw,
      "gender": newGender,
      "height": newHeight,
      "weight": newWeight,
      "goal_Weight": newGoalWeight,
      "training_level": newLevel,
      //"profile_picture": newPicture,
    };

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      log(responseData.toString());
      return responseData;
    } else {
      print('Failed to update user');
      print('Status Code: ${response.statusCode}');
      log(response.body);
      throw "Can't update the user";
    }
  }

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
