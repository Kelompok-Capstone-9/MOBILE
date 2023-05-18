import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'GoFit',
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w700,
              fontSize: 48,
              color: const Color(0xffFF7F00),
            ),
          ),
        ),
      ),
    );
  }
}
