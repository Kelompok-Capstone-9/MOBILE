import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gofit_apps/model/login.dart';
import '../model/apis/service_api.dart';
import '../view/login/login_screen.dart';

class LoginProvider extends ChangeNotifier {
  final apiService = ApiGym();
  UserLogin? _userLogin;
  UserLogin? get userLogin => _userLogin;

  UserModelMetadata? _userLoginResponse;
  UserModelMetadata? get userLoginResponse => _userLoginResponse;

  int? statusCode;
  String? message;

  Future<void> login({required String email, required String password}) async {
    try {
      final result = await ApiGym.loginUsers(email, password);

      _userLogin = UserLogin.fromJson(result['data']);
      _userLoginResponse = UserModelMetadata.fromJson(result['metadata']);
      statusCode = getStatusCode(result);

      if (userLoginResponse!.statusCode == 200) {
        statusCode = 200;
        message = userLoginResponse!.message;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        prefs.setString('password', password);

        notifyListeners();
      }
      print('Status code: ${userLoginResponse!.statusCode}');
      print('Status global: $message');
      print('message global: $message');
    } catch (e) {
      print(e);
    }
  }

  int getStatusCode(Map<String, dynamic> response) {
    if (response.containsKey('status_code')) {
      return response['status_code'];
    } else {
      return 0;
    }
  }

  Future<void> logout(
      {required int params, required BuildContext context}) async {
    statusCode = 0;
    _userLogin = null; // Hapus data model UserLogin
    _userLoginResponse = null; // Hapus data model UserModelMetadata

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormLogin()),
    );

    notifyListeners();
    print('Status code: $statusCode');
  }

  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    if (savedEmail != null && savedPassword != null) {
      await login(email: savedEmail, password: savedPassword);

      return userLoginResponse?.statusCode == 200;
    }

    return false;
  }
}
