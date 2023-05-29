import 'package:flutter/material.dart';
import 'package:gofit_apps/view/explore/explore_screen.dart';
import 'package:gofit_apps/view/search_gym_screen.dart';
import 'package:gofit_apps/view/search_loc_screen.dart';
import 'package:gofit_apps/view/ticket/ticket_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ExploreScreen(),
      home: TicketScreen(),
    );
  }
}
