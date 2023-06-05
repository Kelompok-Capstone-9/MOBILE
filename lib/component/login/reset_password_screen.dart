import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/color_style.dart';
import '../../view/login/login_screen.dart';
import '../../component/login/validator.dart';
import '../../view/register/widget/decoration_form.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isFormFilled = false;
  bool hidePw = false;
  bool hideNewPw = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff030303)),
        backgroundColor: const Color(0xFFF6F6F6),
        elevation: 0.2,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                height: 280,
                child: Image.asset(
                  'assets/images/ImageReset.png',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reset Password',
                        style: ThemeText.headingLogin,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        obscureText: hidePw ? false : true,
                        controller: _passwordController,
                        decoration: DecorationFormStyle.decorationForm(
                          labelText: 'New Password',
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFFB5B5B5),
                            size: 16,
                          ),
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
                        onChanged: (value) {
                          setState(() {
                            isFormFilled =
                                _passwordController.text.isNotEmpty &&
                                    _newPasswordController.text.isNotEmpty;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        obscureText: hideNewPw ? false : true,
                        controller: _newPasswordController,
                        decoration: DecorationFormStyle.decorationForm(
                          labelText: 'Confirm New Password',
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFFB5B5B5),
                            size: 16,
                          ),
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
                        onChanged: (value) {
                          setState(() {
                            isFormFilled =
                                _passwordController.text.isNotEmpty &&
                                    _newPasswordController.text.isNotEmpty;
                          });
                        },
                        validator: (confirmPw) =>
                            ConfirmPasswordValidator.validateConfirmPw(
                                confirmPw, _passwordController.text),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: isFormFilled
                                  ? ColorsTheme.activeButton
                                  : ColorsTheme.inActiveButton),
                          onPressed: () {
                            final isValidForm =
                                _formKey.currentState!.validate();
                            if (isValidForm) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Succes Reset Password',
                                    style: ThemeText.heading2,
                                  ),
                                  backgroundColor: ColorsTheme.activeButton,
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FormLogin(),
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              'Submit',
                              style: GoogleFonts.josefinSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                color: isFormFilled
                                    ? ColorsTheme.activeText
                                    : ColorsTheme.inActiveText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
