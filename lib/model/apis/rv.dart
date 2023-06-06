import 'dart:convert';
import 'dart:developer';

import 'package:gofit_apps/model/login.dart';
import 'package:gofit_apps/model/register.dart';
import 'package:http/http.dart ' as http;

class ApiGym {
  static const String baseUrl = 'http://18.141.56.154:8000';
  static const String login = '/login';
  static const String register = '/register';
  static const String user = '/user';

  /*  untuk endpoints lain-lain bisa menyusul ya, keep spirit kawan :)
      - kalau ada yang kurang, konfirmasi aja ya, PC atau di group
      - jangan lupa di LOG ya
      semangat tim uhuy ...

  */
  /*  "email" : "mobile@email.com",
     "password" : "Mobile9_"
     */

  static Future loginUsers(

      //TODO: terima paramater dari controller, dsb
      // jangan lupa login itu pake token ya
      uname,
      upass) async {
    final url = Uri.parse('$baseUrl$login');
    final Map<String, dynamic> requestBody = {
      "email": "erorr@gmail.com",
      "password": "errorterus"
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $token',
      },
      body: jsonEncode(requestBody),
    );

    // final responseData = json.decode(response.body);
    // final token = responseData['token'];
    // log(token);
    // log(responseData.toString());
    if (response.statusCode == 200) {
      log(response.body);
      if (response.statusCode == 200) {
        return UserLogin.fromJson(jsonDecode(response.body));
      } else {
        print('Failed to login');
        print('Status Code: ${response.statusCode}');
        log(response.body);
      }
      return null;
    }
  }

  static registerUser(Data data) {}
}
