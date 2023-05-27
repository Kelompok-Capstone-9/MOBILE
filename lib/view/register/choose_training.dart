import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/widget/card_training.dart';
import 'package:hovering/hovering.dart';

import 'join_member_screen.dart';

class ChooseTrainingScreen extends StatefulWidget {
  const ChooseTrainingScreen({Key? key}) : super(key: key);
  @override
  State<ChooseTrainingScreen> createState() => _ChooseTrainingScreenState();
}

class _ChooseTrainingScreenState extends State<ChooseTrainingScreen> {
  @override
  Widget build(BuildContext context) {
    var isSelected = false;
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
        backgroundColor: ColorsTheme.bgScreen,
        title: Text('Step 5 of 6', style: ThemeText.heading1),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          const Padding(padding: EdgeInsets.only(left: 20, right: 20)),
          const SizedBox(
            height: 36,
          ),
          Center(
            child: Text('Choose Training Level', style: ThemeText.headingLogin),
          ),
          const SizedBox(
            height: 36,
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
              child: Text(
                'Beginner',
                style: ThemeText.heading1,
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
              child: Text(
                'Intermediate',
                style: ThemeText.heading1,
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
              child: Text(
                'Advance',
                style: ThemeText.heading1,
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
                    builder: (context) => const JoinMemberScreen()));
              },
              color: ColorsTheme.activeButton,
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
        ]),
      )),
    );
  }
}
