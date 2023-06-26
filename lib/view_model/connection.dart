import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';
import '../view/connection.dart';

 Future<void> checkInternetConnection(BuildContext context) async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (!isConnected) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ConnectionErrorScreen()),
      );
    }
  }
