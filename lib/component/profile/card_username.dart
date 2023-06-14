import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../themes/color_style.dart';
import '../../model/login.dart';
import '../../view_model/login_provider.dart';

class CardUsername extends StatefulWidget {
  final UserLogin? user;
  final String token;

  const CardUsername({required this.user, required this.token, Key? key})
      : super(key: key);

  @override
  State<CardUsername> createState() => _CardUsernameState();
}

class _CardUsernameState extends State<CardUsername> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.user?.name ?? '';
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Change Username',
        style: ThemeText.headingTitle,
      ),
      content: TextFormField(
        controller: _usernameController,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsTheme.colorButton),
          ),
          hintText: 'Username',
          hintStyle: ThemeText.headingInputForm,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please input username';
          }
          return null;
        },
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
          child: Text('Save', style: ThemeText.headingCustom),
          onPressed: () {
            if (widget.user != null) {
              final updatedUser = UserLogin(
                id: widget.user!.id,
                email: widget.user!.email,
                password: widget.user!.password,
                name: _usernameController.text,
              );
              Provider.of<LoginProvider>(context, listen: false)
                  .updateUser(updatedUser, widget.token)
                  .then((_) {
                Navigator.pop(context, _usernameController.text);
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
