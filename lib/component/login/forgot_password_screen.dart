import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../themes/color_style.dart';
import '../register/decoration_form.dart';
import 'otp_screen.dart';
import '../../component/login/validator.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isFormFilled = false;

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
                'assets/images/ImageForgot.png',
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: ThemeText.headingLogin,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Don’t worry it happens. Please enter the address associated with your account",
                      style: ThemeText.headingSub,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _emailController,
                      decoration: DecorationFormStyle.decorationForm(
                        labelText: 'Email Address',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Color(0xFFB5B5B5),
                          size: 16,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          isFormFilled = _emailController.text.isNotEmpty;
                        });
                      },
                      validator: (email) =>
                          EmailValidatorLogin.validateEmail(email),
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
                          final isValidForm = _formKey.currentState!.validate();
                          if (isValidForm) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OTPScreen(),
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
        )),
      ),
    );
  }
}
