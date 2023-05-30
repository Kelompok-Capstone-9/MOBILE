// Import the necessary packages and libraries
import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

// Create a stateful widget for the screen
class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

// Define the state for the screen
class _ActivitiesScreenState extends State<ActivitiesScreen> {
  int _currentIndex = 0;

  // Create a list of tab bars
  final List<Widget> _tabBars = [
    const Tab(
      text: 'On Progress',
    ),
    const Tab(
      text: 'Finished',
    ),
  ];

  // Create a list of tab bar views
  final List<Widget> _tabBarViews = [
    const OnProgressTab(),
    const FinishedTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabBars.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tab Screen',
            style: ThemeText.heading1,
          ),
          backgroundColor: ColorsTheme.bgScreen,
          elevation: 0,
          bottom: TabBar(
            labelStyle: ThemeText.heading1,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey[600],
            indicator: BoxDecoration(
              color: Colors.orange,
            ),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabs: _tabBars,
          ),
        ),
        body: _tabBarViews[_currentIndex],
      ),
    );
  }
}

// Define the home tab view
class OnProgressTab extends StatelessWidget {
  const OnProgressTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('This is the Home Tab'),
    );
  }
}

// Define the settings tab view
class FinishedTab extends StatelessWidget {
  const FinishedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('This is the Settings Tab'),
    );
  }
}
