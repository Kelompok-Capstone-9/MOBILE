import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../themes/color_style.dart';
import '../../model/login.dart';
import '../../view_model/login_provider.dart';

class CardGoalWeight extends StatefulWidget {
  final UserLogin? user;
  final String token;

  const CardGoalWeight({required this.user, required this.token, Key? key})
      : super(key: key);
  @override
  State<CardGoalWeight> createState() => _CardGoalWeightState();
}

class _CardGoalWeightState extends State<CardGoalWeight> {
  List<bool> isSelected = [true, false];
  double goalWeightKg = 0.0;
  double goalWeightLb = 0.0;
  final _goalWeightController = TextEditingController();
  final double kilogramToPound = 2.20462;

  @override
  void initState() {
    super.initState();
    _goalWeightController.text = (widget.user?.goal_weight ?? 0).toString();
    goalWeightKg = double.tryParse(_goalWeightController.text) ?? 0.0;
    goalWeightLb = goalWeightKg * kilogramToPound;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Change Goal Weight',
        style: ThemeText.headingTitle,
      ),
      content: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _goalWeightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsTheme.colorButton),
                      ),
                      hintText: 'Goal Weight',
                      hintStyle: ThemeText.headingInputForm,
                    ),
                    onChanged: (value) {
                      setState(() {
                        goalWeightKg = double.tryParse(value) ?? 0.0;
                        goalWeightLb = goalWeightKg * kilogramToPound;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffE6E6E6)),
                  child: ToggleButtons(
                    isSelected: isSelected,
                    onPressed: (index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected.length;
                            buttonIndex++) {
                          isSelected[buttonIndex] = (buttonIndex == index);
                        }
                        if (isSelected[1]) {
                          goalWeightLb = goalWeightKg * kilogramToPound;
                          _goalWeightController.text =
                              goalWeightLb.toStringAsFixed(2);
                        } else {
                          goalWeightKg =
                              (goalWeightLb / kilogramToPound).roundToDouble();
                          _goalWeightController.text =
                              goalWeightKg.toStringAsFixed(0);
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(20.0),
                    borderColor: Colors.transparent,
                    borderWidth: 0,
                    selectedBorderColor: Colors.transparent,
                    fillColor: Colors.transparent,
                    constraints:
                        const BoxConstraints(maxWidth: 35, maxHeight: 26),
                    children: [
                      TextButton(
                        onPressed: null,
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: isSelected[0]
                              ? Colors.white
                              : const Color(0xffE6E6E6),
                        ),
                        child: Text(
                          'kg',
                          style: GoogleFonts.josefinSans(
                              color: isSelected[0]
                                  ? const Color(0xff030303)
                                  : const Color(0xff606060),
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextButton(
                        onPressed: null,
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: isSelected[1]
                              ? Colors.white
                              : const Color(0xffE6E6E6),
                        ),
                        child: Text(
                          'lb',
                          style: GoogleFonts.josefinSans(
                              color: isSelected[1]
                                  ? const Color(0xff030303)
                                  : const Color(0xff606060),
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Cancel',
            style: ThemeText.headingCustom,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          onPressed: () {
            if (widget.user != null) {
              final updatedUser = UserLogin(
                id: widget.user!.id,
                email: widget.user!.email,
                goal_weight: goalWeightKg.toInt(),
              );

              Provider.of<LoginProvider>(context, listen: false)
                  .updateUser(updatedUser, widget.token)
                  .then((_) {
                Navigator.pop(context, updatedUser.goal_weight);
              }).catchError((error) {
                print('Failed to update user: $error');
              });
            } else {
              print('User is null');
            }
          },
          child: Text(
            'Save',
            style: ThemeText.headingCustom,
          ),
        ),
      ],
    );
  }
}
