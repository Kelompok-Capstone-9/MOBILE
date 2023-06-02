import 'package:flutter/material.dart';
import 'package:gofit_apps/view/activities/activities_screen.dart';
import 'package:gofit_apps/view/article/artikel_screen.dart';
import 'package:gofit_apps/view/profile/profile_screen.dart';
import 'package:gofit_apps/view/training/training_screen.dart';
import '../../themes/color_style.dart';
import '../dashboard/dashboard.dart';
import '../explore/explore_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Widget> _pages;
  late int currentIndex;
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    updateView(0);
    super.initState();
  }

  void updateView(int index) {
    setState(() {
      currentIndex = index;
      _pages = const [
        Home_Screen(),
        ExploreScreen(),
        TrainingScreen(),
        // Artikel(),
        ActivitiesScreen(),
        ProfileScreen()
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[currentIndex]),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildNavItem(0, Icons.home, 'Home'),
              buildNavItem(1, Icons.explore_outlined, 'Explore'),
              buildNavItem(2, Icons.fitness_center, 'Training'),
              buildNavItem(3, Icons.confirmation_number_outlined, 'Activities'),
              buildNavItem(4, Icons.account_circle_outlined, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(int index, IconData iconData, String text) {
    final isActive = currentIndex == index;
    final color = isActive ? Colors.orange : Colors.grey;
    return InkWell(
      onTap: () {
        updateView(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: color,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            text,
            style: ThemeText.headingMenu,
          )
        ],
      ),
    );
  }
}
