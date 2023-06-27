import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gofit_apps/model/apis/service_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordProvider with ChangeNotifier {
  final api = ApiGym();
//
  String generateOTP() {
    Random random = Random();
    int otpLength = 4;
    String otp = '';

    for (int i = 0; i < otpLength; i++) {
      otp += random.nextInt(10).toString();
    }

    return otp;
  }

// save OTP ke dalam Shared Preferences
  Future<void> saveOTPToSharedPreferences(String otp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('otp', otp);
  }

// ambil OTP dari Shared Preferences
  Future<String?> getOTPFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('otp');
  }

//Fungsi untuk mengirim OTP melalui email
  void sendOTPByEmail(String email, String otp) async {
    try {
      final sendReport = await api.sendOTP(email, otp);
      print('Message sent: ${sendReport.sent}');
    } catch (e) {
      print('Error sending email: $e');
    }
  }
}
