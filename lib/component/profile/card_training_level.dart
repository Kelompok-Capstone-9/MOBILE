import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../themes/color_style.dart';
import '../../model/login.dart';
import '../../view_model/login_provider.dart';

class CardTrainingLevel extends StatefulWidget {
  final UserLogin? user;
  final String token;

  const CardTrainingLevel({required this.user, required this.token, Key? key})
      : super(key: key);

  @override
  State<CardTrainingLevel> createState() => _CardTrainingLevelState();
}

class _CardTrainingLevelState extends State<CardTrainingLevel> {
  String? selecLevel;

  @override
  void initState() {
    super.initState();
    selecLevel = widget.user?.training_level ?? '';
  }

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
            value: 'beginner',
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
            value: 'intermediate',
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
              'Advance',
              style: ThemeText.heading1,
            ),
            value: 'advance',
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
            if (widget.user != null) {
              final updatedUser = UserLogin(
                id: widget.user!.id,
                email: widget.user!.email,
                training_level: selecLevel,
              );
              Provider.of<LoginProvider>(context, listen: false)
                  .updateUser(updatedUser, widget.token)
                  .then((_) {
                Navigator.pop(context, selecLevel);
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
