import 'package:flutter/material.dart';
import '../../../themes/color_style.dart';

class CardPassword extends StatelessWidget {
  CardPassword({super.key});

  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Change Password',
        style: ThemeText.headingTitle,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _currentPasswordController,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorsTheme.colorButton),
              ),
              hintText: 'Current Password',
              hintStyle: ThemeText.headingInputForm,
            ),
          ),
          TextField(
            controller: _newPasswordController,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorsTheme.colorButton),
              ),
              hintText: 'New Password',
              hintStyle: ThemeText.headingInputForm,
            ),
          ),
          TextField(
            controller: _confirmNewPwController,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorsTheme.colorButton),
              ),
              hintText: 'Confirm New Password',
              hintStyle: ThemeText.headingInputForm,
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
