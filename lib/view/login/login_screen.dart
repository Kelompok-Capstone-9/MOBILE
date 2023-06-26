import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofit_apps/view/register/register_screen.dart';
import 'package:gofit_apps/view_model/login_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../component/login/forgot_password_screen.dart';
import '../../component/navbar/home.dart';
import '../../component/register/decoration_form.dart';
import '../../themes/color_style.dart';
import '../../view_model/connection.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  FormLoginState createState() {
    return FormLoginState();
  }
}

class FormLoginState extends State<FormLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidePw = false;
  bool isFormFilled = false;
  String appName = 'GoFit';

  @override
  void initState() {
    super.initState();
    checkInternetConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 66, bottom: 66),
              child: Text(
                appName,
                style: ThemeText.headingLabelGofit,
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
                      'Login',
                      style: ThemeText.headingLogin,
                    ),
                    const SizedBox(height: 16),
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
                          isFormFilled = _emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      obscureText: hidePw ? false : true,
                      controller: _passwordController,
                      decoration: DecorationFormStyle.decorationForm(
                        labelText: 'Password',
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
                          isFormFilled = _emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassword(),
                        ),
                      );
                    },
                    child:
                        Text('Forgot Password?', style: ThemeText.headingText),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: isFormFilled
                        ? ColorsTheme.activeButton
                        : ColorsTheme.inActiveButton),
                onPressed: () async {
                  final isValidForm = _formKey.currentState!.validate();
                  if (isValidForm) {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final loginProvider =
                        Provider.of<LoginProvider>(context, listen: false);

                    try {
                      await loginProvider.login(
                          email: email, password: password);

                      if (loginProvider.userLogin != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Email or password is incorrect.',
                              style: ThemeText.heading2,
                            ),
                            backgroundColor: ColorsTheme.activeButton,
                          ),
                        );
                      }
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'An error occurred: $error',
                            style: ThemeText.heading2,
                          ),
                          backgroundColor: ColorsTheme.activeButton,
                        ),
                      );
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Login',
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
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: ThemeText.headingAccount,
                ),
                TextButton(
                  onPressed: () {
                    log('masuk ke halaman sign in email');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  },
                  child: Text('Sign Up', style: ThemeText.headingText),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
