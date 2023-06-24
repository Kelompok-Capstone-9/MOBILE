import 'package:flutter/material.dart';
import 'package:gofit_apps/component/navbar/home.dart';
import 'package:gofit_apps/view/explore/explore_screen.dart';

import 'package:gofit_apps/view/training/beginner_screen.dart';
import 'package:gofit_apps/view/training/training_kategori.dart';
import 'package:gofit_apps/view/training/training_screen.dart';
import 'package:gofit_apps/view_model/artikel_provider.dart';
import 'package:gofit_apps/view_model/booking_provider.dart';
import 'package:gofit_apps/view_model/dashboard_provider.dart';
import 'package:gofit_apps/view_model/forgot_provider.dart';
import 'package:gofit_apps/view_model/level_provider.dart';
import 'package:gofit_apps/view_model/newsLetter_provider.dart';
import 'package:gofit_apps/view_model/profile_provider.dart';
import 'package:gofit_apps/view_model/register_provider.dart';
import 'package:gofit_apps/view_model/training_provider.dart';
import 'view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'view_model/login_provider.dart';
import 'view_model/plan_member_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /*  sementara kita daftarin semua dulu
            nunggu sebentar ..
        */
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => TrainingProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => NewsLetterProvider()),
        ChangeNotifierProvider(create: (_) => PlanProvider()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (_) => LevelProvider()),
        ChangeNotifierProvider(create: (_) => ArtikelProvider()),
      ],
      //merge transaksi
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: Home()),
    );
  }
}
