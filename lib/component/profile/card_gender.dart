import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../themes/color_style.dart';
import '../../model/login.dart';
import '../../view_model/login_provider.dart';

class CardGender extends StatefulWidget {
  final UserLogin? user;
  final String token;

  const CardGender({required this.user, required this.token, Key? key})
      : super(key: key);

  @override
  State<CardGender> createState() => _CardGenderState();
}

class _CardGenderState extends State<CardGender> {
  String? selecGender;

  @override
  void initState() {
    super.initState();
    selecGender = widget.user?.gender ?? '';
  }

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
            value: 'pria',
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
            value: 'wanita',
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
            if (widget.user != null) {
              final updatedUser = UserLogin(
                id: widget.user!.id,
                email: widget.user!.email,
                password: widget.user!.password,
                gender: selecGender,
              );
              Provider.of<LoginProvider>(context, listen: false)
                  .updateUser(updatedUser, widget.token)
                  .then((_) {
                Navigator.pop(context, selecGender);
              }).catchError((error) {
                print('Failed to update user: $error');
              });
            } else {
              print('User is null');
            }
          },
        ),
      ],
    );
  }
}
