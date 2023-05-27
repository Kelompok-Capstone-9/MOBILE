import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/height_screen.dart';
import 'package:hovering/hovering.dart';

class ChooseGenderScreen extends StatefulWidget {
  const ChooseGenderScreen({Key? key}) : super(key: key);
  @override
  State<ChooseGenderScreen> createState() => _ChooseGenderScreenState();
}

class _ChooseGenderScreenState extends State<ChooseGenderScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        backgroundColor: ColorsTheme.bgScreen,
        title: Text(
          'Step 1 of 6',
          style: ThemeText.heading1,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 36)),
              Padding(
                padding: const EdgeInsets.only(bottom: 36),
                child: Text('Choose Gender', style: ThemeText.headingLogin),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {});
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: const Color((0xffFF7F00)),
                    disabledForegroundColor: ColorsTheme.bgScreen),
                child: Container(
                  width: 328,
                  height: 60,
                  padding: const EdgeInsets.only(
                      left: 16, top: 22, bottom: 22, right: 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.male_outlined,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Text('Male', style: ThemeText.heading1)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {});
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: const Color((0xffFF7F00)),
                    disabledForegroundColor: ColorsTheme.bgScreen),
                child: Container(
                  width: 328,
                  height: 60,
                  padding: const EdgeInsets.only(
                      left: 16, top: 22, bottom: 22, right: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.female_outlined,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Text('Female', style: ThemeText.heading1)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: HoverButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onpressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HeightScreen()));
                  },
                  color: isSelected
                      ? const Color(0xffFF7F00)
                      : const Color(0xffDFDFDF),
                  hoverColor: const Color(0xffFF7F00),
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
        ),
      ),
    );
  }
}
