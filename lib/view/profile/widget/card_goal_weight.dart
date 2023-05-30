import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../themes/color_style.dart';

class CardGoalWeight extends StatefulWidget {
  const CardGoalWeight({super.key});
  @override
  State<CardGoalWeight> createState() => _CardGoalWeightState();
}

class _CardGoalWeightState extends State<CardGoalWeight> {
  List<bool> isSelected = [true, false];
  double goalValue = 0.0;
  final _goalController = TextEditingController();

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
                    controller: _goalController,
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
                        goalValue = double.tryParse(value) ?? 0.0;
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
            // final selectedUnit = isSelected[0] ? 'kg' : 'lb';
            // print('Berat: $goalValue $selectedUnit');
            Navigator.of(context).pop();
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
