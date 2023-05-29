import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/weight_goal_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);
  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        backgroundColor: ColorsTheme.bgScreen,
        title: Text('Step 3 of 6', style: ThemeText.heading1),
        centerTitle: true,
        leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(left: 20, right: 20)),
            const SizedBox(
              height: 36,
            ),
            Center(
              child: Text('Input Your Weight', style: ThemeText.headingLogin),
            ),
            const SizedBox(
              height: 36,
            ),
            ToggleSwitch(
              
              minWidth: 114,
              minHeight: 34,
              cornerRadius: 20,
              customTextStyles: [ThemeText.heading1],
              activeBgColors: const [
                [Colors.white],
                [Colors.white]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.black26,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              
              labels: const ['Kilogram', 'Pound'],
              onToggle: (index) {},
            ),
            const SizedBox(
              height: 56,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  width: 80,
                  height: 60,
                  child: const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF606060),
                          width: 2,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      fillColor: Color(0xFFFFFFFF),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'kg',
                  style: ThemeText.heading1,
                ),
              ],
            ),
            const SizedBox(
              height: 68,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color(0xffFF7F00)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WeightGoalScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text('Continue', style: ThemeText.heading1),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
