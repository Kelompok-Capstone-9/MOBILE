import 'package:flutter/material.dart';
import '../../../themes/color_style.dart';

class CardGender extends StatefulWidget {
  const CardGender({super.key});

  @override
  State<CardGender> createState() => _CardGenderState();
}

class _CardGenderState extends State<CardGender> {
  String? selecGender;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Change Gender',
        style: ThemeText.headingTitle,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            title: Text(
              'Male',
              style: ThemeText.heading1,
            ),
            value: 'Male',
            groupValue: selecGender,
            onChanged: (value) {
              setState(() {
                selecGender = value;
              });
            },
            activeColor: ColorsTheme.colorButton,
          ),
          RadioListTile(
            title: Text(
              'Female',
              style: ThemeText.heading1,
            ),
            value: 'Female',
            groupValue: selecGender,
            onChanged: (value) {
              setState(() {
                selecGender = value;
              });
            },
            activeColor: ColorsTheme.colorButton,
          )
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
          child: Text(
            'Save',
            style: ThemeText.headingCustom,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
