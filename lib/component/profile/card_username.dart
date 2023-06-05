import 'package:flutter/material.dart';
import '../../../themes/color_style.dart';

class CardUsername extends StatelessWidget {
  CardUsername({super.key});

  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Change Username',
        style: ThemeText.headingTitle,
      ),
      content: TextField(
        controller: _usernameController,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsTheme.colorButton),
          ),
          hintText: 'Username',
          hintStyle: ThemeText.headingInputForm,
        ),
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
