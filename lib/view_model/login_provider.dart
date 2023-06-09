import 'dart:developer';
import 'package:flutter/material.dart';
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
        notifyListeners();
      }
      print('Status code: ${userLoginResponse!.statusCode}');

      log('Status global: $message');
      log('message global: $message');
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

  Future<void> logout({required int params, required context}) async {
    statusCode = 0;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const FormLogin()));

    notifyListeners();
    log('Status code : $statusCode }');
  }
}
