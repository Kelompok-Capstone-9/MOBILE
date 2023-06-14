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
  String? _token;
  String? get token => _token;

  Future<void> login({required String email, required String password}) async {
    try {
      final result = await ApiGym.loginUsers(email, password);

      _userLogin = UserLogin.fromJson(result['data']);
      _userLoginResponse = UserModelMetadata.fromJson(result['metadata']);
      statusCode = getStatusCode(result);
      _token = result['token'];

      if (userLoginResponse!.statusCode == 200) {
        statusCode = 200;
        message = userLoginResponse!.message;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        prefs.setString('password', password);
        prefs.setString('token', _token!); // Simpan token otentikasi
        print('tokennya adalah : $token');
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

  Future<void> updateUser(UserLogin user, String token) async {
    try {
      final result = await ApiGym.updateUser(
        user.id ?? 0,
        user.name ?? '',
        token,
        // user.password ?? '',
        user.gender ?? '',
        user.height ?? 0,
        user.weight ?? 0,
        user.goal_weight ?? 0,
      );
      _userLogin = UserLogin.fromJson(result['data']);
      _userLoginResponse = UserModelMetadata.fromJson(result['metadata']);
      statusCode = userLoginResponse?.statusCode;

      if (statusCode == 200) {
        message = userLoginResponse?.message;
        notifyListeners();
      }

      print('Status code: $statusCode');
      print('Status global: $message');
      print('message global: $message');
    } catch (e) {
      print('Failed to update user: $e');
    }
    notifyListeners();
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    return _token;
  }
}
