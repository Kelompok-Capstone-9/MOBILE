import 'package:flutter/material.dart';
import 'package:gofit_apps/view/connection.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isConnected = await InternetConnectionChecker().hasConnection;
  runApp(MyApp(isConnected: isConnected));
}

class MyApp extends StatelessWidget {
  final bool isConnected;

  const MyApp({super.key, required this.isConnected});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => TrainingProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => NewsLetterProvider()),
        ChangeNotifierProvider(create: (_) => PlanProvider()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isConnected
            ? const SplashScreen()
            : const ConnectionErrorScreen(),
      ),
    );
  }
}
