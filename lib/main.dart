import 'package:flutter/material.dart';

import 'package:gofit_apps/view/explore/explore_screen.dart';
import 'package:gofit_apps/view/search_gym_screen.dart';
import 'package:gofit_apps/view/search_loc_screen.dart';
import 'package:gofit_apps/view/ticket/ticket_screen.dart';


import 'package:gofit_apps/view/home_screen.dart';

import 'package:gofit_apps/view/register/gender_screen.dart';
import 'package:gofit_apps/view/register/otp_regist_screen.dart';
import 'package:gofit_apps/view/register/register_screen.dart';

import 'view/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: RegisterScreen());
  }
}
