import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiGym {
  static const String baseUrl = 'http://18.141.56.154:8000';
  static const String login = '/login';
  static const String register = '/register';
  static const String user = '/users';

  static Future<Map<String, dynamic>> loginUsers(
      String uname, String upass) async {
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
}
