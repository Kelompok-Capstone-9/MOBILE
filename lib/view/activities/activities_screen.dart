import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorsTheme.bgScreen,
        appBar: AppBar(
          title: Text(
            'Activities',
            style: ThemeText.heading1,
          ),
          backgroundColor: ColorsTheme.bgScreen,
          elevation: 0,
        ),
        body: Column(
          children: [
            TabBar(
              labelColor: Colors.black,
              labelStyle: ThemeText.heading1,
              indicator: BoxDecoration(
                color: Colors.orange,
              ),
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(
                  text: 'On Progress',
                ),
                Tab(
                  text: 'Finished',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
