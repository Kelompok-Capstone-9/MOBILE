import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/weight_screen.dart';
import 'package:hovering/hovering.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({Key? key}) : super(key: key);
  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  bool isSelected = false;
  var label = [ItemChoice(1, 'Centimetre'), ItemChoice(2, 'Feet')];
  var idSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        backgroundColor: ColorsTheme.bgScreen,
        title: Text('Step 2 of 6', style: ThemeText.heading1),
        centerTitle: true,
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
              child: Text('Input Your Height', style: ThemeText.headingLogin),
            ),
            const SizedBox(
              height: 36,
            ),
            ToggleSwitch(
              minWidth: 110,
              minHeight: 30,
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
              labels: const ['Centimetre', 'Feet'],
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
                      counterText: "",
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
                    maxLength: 3,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'cm',
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
              child: HoverButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onpressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WeightScreen()));
                },
                color: isSelected
                    ? const Color(0xffFF7F00)
                    : const Color(0xffDFDFDF),
                hoverTextColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Continue',
                    style: ThemeText.heading1,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class ItemChoice {
  final int id;
  final String label;

  ItemChoice(this.id, this.label);
}
