import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 66, left: 117, right: 117, bottom: 66),
                  child: Text(
                    'GoFit',
                    style: GoogleFonts.josefinSans(
                        color: const Color(0xFFFF7F00),
                        fontSize: 48,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 16),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.josefinSans(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ),
                buildRegisterForm()
              ],
            ),
          ),
        ));
  }

  buildRegisterForm() => Container(
        padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  fillColor: const Color(0xFFFFFFFF),
                  prefixIcon: const Icon(
                    Icons.person_2_outlined,
                    color: Color(0xFFB5B5B5),
                  ),
                  labelText: 'Username',
                  labelStyle: GoogleFonts.josefinSans(
                      fontSize: 14, color: const Color(0xFFB5B5B5)),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null && value.length < 4) {
                    return 'Enter at least 4 characters';
                  } else {
                    return null; //form is valid
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  fillColor: const Color(0xFFFFFFFF),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xFFB5B5B5),
                  ),
                  labelText: 'Email Address',
                  labelStyle: GoogleFonts.josefinSans(
                      fontSize: 14, color: const Color(0xFFB5B5B5)),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null && value.length < 4) {
                    return 'Enter at least 4 characters';
                  } else {
                    return null; //form is valid
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  fillColor: const Color(0xFFFFFFFF),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xFFB5B5B5),
                  ),
                  labelText: 'Password',
                  labelStyle: GoogleFonts.josefinSans(
                      fontSize: 14, color: const Color(0xFFB5B5B5)),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null && value.length < 4) {
                    return 'Enter at least 4 characters';
                  } else {
                    return null; //form is valid
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmpasswordController,
                decoration: InputDecoration(
                  fillColor: const Color(0xFFFFFFFF),
                  prefixIcon: const Icon(
                    Icons.lock_outlined,
                    color: Color(0xFFB5B5B5),
                  ),
                  labelText: 'Confirm Password',
                  labelStyle: GoogleFonts.josefinSans(
                      fontSize: 14, color: const Color(0xFFB5B5B5)),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != null && value.length < 4) {
                    return 'Enter at least 4 characters';
                  } else {
                    return null; //form is valid
                  }
                },
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: isFormFilled
                          ? const Color(0xffFF7F00)
                          : const Color(0xffDFDFDF)),
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
