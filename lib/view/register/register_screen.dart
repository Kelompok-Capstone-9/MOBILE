import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/widget/decoration_form.dart';
import 'package:gofit_apps/view/register/widget/validator_register.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  bool isFormFilled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 66, bottom: 66),
              child: Text('GoFit', style: ThemeText.headingLabelGofit),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Text('Sign Up', style: ThemeText.headingLogin),
              ),
            ),
            buildRegisterForm()
          ],
        ),
      ),
    );
  }

  buildRegisterForm() => Container(
        padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: DecorationFormStyle.decorationForm(
                    labelText: 'Username',
                    prefixIcon: const Icon(Icons.person_outlined)),
                onChanged: (value) {
                  setState(
                    () {
                      isFormFilled = _nameController.text.isNotEmpty &&
                          _emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty &&
                          _confirmpasswordController.text.isNotEmpty;
                    },
                  );
                },
                validator: (username) =>
                    UsernameValidatorSignUp.validateUsername(username),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: DecorationFormStyle.decorationForm(
                    labelText: 'Email Address',
                    prefixIcon: const Icon(Icons.email_outlined)),
                onChanged: (value) {
                  setState(() {
                    isFormFilled = _nameController.text.isNotEmpty &&
                        _emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty &&
                        _confirmpasswordController.text.isNotEmpty;
                  });
                },
                validator: (email) =>
                    EmailValidatorSignup.validateEmailSignUp(email),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: DecorationFormStyle.decorationForm(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline)),
                onChanged: (value) {
                  setState(() {
                    isFormFilled = _nameController.text.isNotEmpty &&
                        _emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty &&
                        _confirmpasswordController.text.isNotEmpty;
                  });
                },
                validator: (confirmPw) =>
                    ConfirmPasswordValidator.validateConfirmPw(
                        confirmPw, _passwordController.text),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmpasswordController,
                decoration: DecorationFormStyle.decorationForm(
                    labelText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock_outline)),
                onChanged: (value) {
                  setState(() {
                    isFormFilled = _nameController.text.isNotEmpty &&
                        _emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty &&
                        _confirmpasswordController.text.isNotEmpty;
                  });
                },
                validator: (confirmPw) =>
                    ConfirmPasswordValidator.validateConfirmPw(
                        confirmPw, _passwordController.text),
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: isFormFilled
                        ? const Color(0xffFF7F00)
                        : const Color(0xffDFDFDF),
                  ),
                  onPressed: () {
                    final isValidForm = formKey.currentState!.validate();
                    if (isValidForm) {}
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        color: isFormFilled
                            ? const Color(0xFFF6F6F6)
                            : const Color(0xFFB5B5B5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
