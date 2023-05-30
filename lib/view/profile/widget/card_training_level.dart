import 'package:flutter/material.dart';
import '../../../themes/color_style.dart';

class CardTrainingLevel extends StatefulWidget {
  const CardTrainingLevel({super.key});

  @override
  State<CardTrainingLevel> createState() => _CardTrainingLevelState();
}

class _CardTrainingLevelState extends State<CardTrainingLevel> {
  String? selecLevel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Change Training Level',
        style: ThemeText.headingTitle,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            title: Text(
              'Beginner',
              style: ThemeText.heading1,
            ),
            value: 'Beginner',
            groupValue: selecLevel,
            onChanged: (value) {
              setState(() {
                selecLevel = value;
              });
            },
            activeColor: const Color(0xffFF7F00),
          ),
          RadioListTile(
            title: Text(
              'Intermediate',
              style: ThemeText.heading1,
            ),
            value: 'Intermediate',
            groupValue: selecLevel,
            onChanged: (value) {
              setState(() {
                selecLevel = value;
              });
            },
            activeColor: const Color(0xffFF7F00),
          ),
          RadioListTile(
            title: Text(
              'Advanced',
              style: ThemeText.heading1,
            ),
            value: 'Advanced',
            groupValue: selecLevel,
            onChanged: (value) {
              setState(() {
                selecLevel = value;
              });
            },
            activeColor: const Color(0xffFF7F00),
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
