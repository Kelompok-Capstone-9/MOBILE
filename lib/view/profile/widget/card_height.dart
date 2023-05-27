import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../themes/color_style.dart';

class CardHeight extends StatefulWidget {
  const CardHeight({super.key});
  @override
  State<CardHeight> createState() => _CardHeightState();
}

class _CardHeightState extends State<CardHeight> {
  List<bool> isSelected = [true, false];
  double heightValue = 0.0;
  final _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Change Height',
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
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsTheme.colorButton),
                      ),
                      hintText: 'Height',
                      hintStyle: ThemeText.headingInputForm,
                    ),
                    onChanged: (value) {
                      setState(() {
                        heightValue = double.tryParse(value) ?? 0.0;
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
                          'cm',
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
                          'ft',
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
            // final selectedUnit = isSelected[0] ? 'cm' : 'ft';
            // print('Height: $heightValue $selectedUnit');
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
