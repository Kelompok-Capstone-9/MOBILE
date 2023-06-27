import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../themes/color_style.dart';
import '../../model/login.dart';
import '../../view_model/login_provider.dart';

class CardPassword extends StatefulWidget {
  final UserLogin? user;
  final String token;

  const CardPassword({required this.user, required this.token, Key? key})
      : super(key: key);

  @override
  State<CardPassword> createState() => _CardPasswordState();
}

class _CardPasswordState extends State<CardPassword> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPwController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidePw = false;
  bool hideNewPw = false;
  bool hideConfirmPw = false;

  @override
  void dispose() {
    _confirmNewPwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Change Password',
        style: ThemeText.headingTitle,
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              obscureText: hidePw ? false : true,
              controller: _currentPasswordController,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorsTheme.colorButton),
                ),
                hintText: 'Current Password',
                hintStyle: ThemeText.headingInputForm,
                suffixIcon: IconButton(
                  color: const Color(0xFFB5B5B5),
                  onPressed: () {
                    setState(() {
                      hidePw = !hidePw;
                    });
                  },
                  icon: hidePw
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.visibility_off_rounded),
                  iconSize: 16,
                ),
              ),
            ),
            TextFormField(
              obscureText: hideNewPw ? false : true,
              controller: _newPasswordController,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorsTheme.colorButton),
                ),
                hintText: 'New Password',
                hintStyle: ThemeText.headingInputForm,
                suffixIcon: IconButton(
                  color: const Color(0xFFB5B5B5),
                  onPressed: () {
                    setState(() {
                      hideNewPw = !hideNewPw;
                    });
                  },
                  icon: hideNewPw
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.visibility_off_rounded),
                  iconSize: 16,
                ),
              ),
            ),
            TextFormField(
              obscureText: hideConfirmPw ? false : true,
              controller: _confirmNewPwController,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorsTheme.colorButton),
                ),
                hintText: 'Confirm New Password',
                hintStyle: ThemeText.headingInputForm,
                suffixIcon: IconButton(
                  color: const Color(0xFFB5B5B5),
                  onPressed: () {
                    setState(() {
                      hideConfirmPw = !hideConfirmPw;
                    });
                  },
                  icon: hideConfirmPw
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.visibility_off_rounded),
                  iconSize: 16,
                ),
              ),
            ),
          ],
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
            if (widget.user != null) {
              final updatedUser = UserLogin(
                id: widget.user!.id,
                email: widget.user!.email,
                password: _confirmNewPwController.text,
              );
              Provider.of<LoginProvider>(context, listen: false)
                  .updateUser(updatedUser, widget.token)
                  .then((_) {
                Navigator.pop(context, _confirmNewPwController.text);
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
