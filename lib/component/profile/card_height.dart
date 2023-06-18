import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../themes/color_style.dart';
import '../../model/login.dart';
import '../../view_model/login_provider.dart';

class CardHeight extends StatefulWidget {
  final UserLogin? user;
  final String token;

  const CardHeight({required this.user, required this.token, Key? key})
      : super(key: key);

  @override
  State<CardHeight> createState() => _CardHeightState();
}

class _CardHeightState extends State<CardHeight> {
  List<bool> isSelected = [true, false];
  double heightValueCm = 0.0;
  double heightValueFt = 0.0;
  final _heightController = TextEditingController();
  double satuanFt = 0.032808399;

  @override
  void initState() {
    super.initState();
    _heightController.text = (widget.user?.height ?? 0).toString();
    heightValueCm = double.tryParse(_heightController.text) ?? 0.0;
    heightValueFt = heightValueCm * satuanFt;
  }

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
                        heightValueCm = double.tryParse(value) ?? 0.0;
                        heightValueFt = heightValueCm * satuanFt;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffE6E6E6),
                  ),
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
                          heightValueFt = heightValueCm * satuanFt;
                          _heightController.text =
                              heightValueFt.toStringAsFixed(2);
                        } else {
                          heightValueCm =
                              (heightValueFt / satuanFt).roundToDouble();
                          _heightController.text =
                              heightValueCm.toStringAsFixed(0);
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
                            fontWeight: FontWeight.w600,
                          ),
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
                            fontWeight: FontWeight.w600,
                          ),
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
                height: heightValueCm.toInt(),
              );

              Provider.of<LoginProvider>(context, listen: false)
                  .updateUser(updatedUser, widget.token)
                  .then((_) {
                Navigator.pop(context, updatedUser.height);
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
