import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:gofit_apps/model/login.dart';
import '../model/apis/service_api.dart';

class LoginProvider extends ChangeNotifier {
  final apiService = ApiGym();
  UserLogin? _userLogin;
  UserLogin? get userLogin => _userLogin;
  String isStatus = '';

  Future<void> login({required String email, required String password}) async {
    try {
      final result = await ApiGym.loginUsers(email, password);
      if (result['error'] != null) {
        // Data tidak sesuai, reset nilai _userLogin menjadi null
        _userLogin = null;
        return;
      }

      _userLogin = UserLogin.fromJson(result['data']);

      if (_userLogin != null) {
        log('a: ${_userLogin!.email}');
        log('b: ${_userLogin!.id}');
      }
    } catch (e) {
      print(e);
    }
  }
}
