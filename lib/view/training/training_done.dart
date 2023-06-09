import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/training/training_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../component/navbar/home.dart';
import '../../component/time_widget.dart';

class TrainingDoneScreen extends StatefulWidget {
  const TrainingDoneScreen({super.key});

  @override
  State<TrainingDoneScreen> createState() => _TrainingDoneScreenState();
}

class _TrainingDoneScreenState extends State<TrainingDoneScreen> {
  int? selectedValue;
  bool isFormFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          decoration: const BoxDecoration(color: Color(0xffFFEFCC)),
          child: Column(
            children: [
              Container(
                height: 430,
                decoration: const BoxDecoration(color: Color(0xffFFEFCC)),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Image(
                        image: AssetImage(
                            'assets/images/Personal-goals-amico.png'),
                        width: 280,
                        height: 280,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('6', style: ThemeText.headingTextDone),
                              Text('Exercise', style: ThemeText.headingTextDone)
                            ],
                          ),
                          Column(
                            children: [
                              Text('100', style: ThemeText.headingTextDone),
                              Text('Kcal', style: ThemeText.headingTextDone)
                            ],
                          ),
                          Column(
                            children: [
                              TimeWidget(
                                  waktu: '100',
                                  typeWaktu: 2,
                                  styleText: ThemeText.headingTextDone),
                              Text('Duration', style: ThemeText.headingTextDone)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 430,
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text('I feel:', style: ThemeText.headingTextDone2),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Easy', style: ThemeText.headingAmountPaid),
                          Text('Exhausted', style: ThemeText.headingAmountPaid)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          radioButton(0),
                          radioButton(1),
                          radioButton(2),
                          radioButton(3),
                          radioButton(4),
                          radioButton(5),
                          radioButton(6),
                          radioButton(7),
                        ],
                      ),
                    ),
                    const SizedBox(height: 85),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: isFormFilled
                                ? ColorsTheme.activeButton
                                : ColorsTheme.inActiveButton),
                        onPressed: () {
                          if (selectedValue != null) {
                            setState(() {
                              isFormFilled = true;
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Home(),
                                  maintainState: false));
                              // _countdownTimer.();
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Done',
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              color: isFormFilled
                                  ? ColorsTheme.activeText
                                  : ColorsTheme.inActiveText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget radioButton(int value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: value,
          groupValue: selectedValue,
          onChanged: (val) {
            setState(() {
              selectedValue = val!;
              isFormFilled = true;
            });
          },
          activeColor: ColorsTheme.colorButton,
        ),
      ],
    );
  }
}
