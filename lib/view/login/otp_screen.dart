import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../themes/color_style.dart';
import 'reset_password_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _inputPin1Controller = TextEditingController();
  final _inputPin2Controller = TextEditingController();
  final _inputPin3Controller = TextEditingController();
  final _inputPin4Controller = TextEditingController();
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 280,
                  child: Image.asset(
                    'assets/images/ImageOTP.png',
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter OTP',
                        style: ThemeText.headingLogin,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'An 4 digit code has been sent to',
                        style: ThemeText.headingSub2,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'mervin.km@gmail.com', //email yg terdaftar masih dummy
                        style: ThemeText.headingSub2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                inputOtp(context),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Container(
                              width: 6,
                              height: 6,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: 'The OTP will be expired in',
                            style: ThemeText.headingAmountPaid,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CountdownTimer(
                      endTime: DateTime.now().millisecondsSinceEpoch +
                          (10 * 60 * 1000),
                      onEnd: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                            'Time Out',
                            style: ThemeText.headingInput,
                          )),
                        );
                      },
                      widgetBuilder: (_, CurrentRemainingTime? time) {
                        if (time == null) {
                          return const Text('00:00');
                        }
                        int remainingTime = (time.min ?? 0).toInt() * 60 +
                            (time.sec ?? 0).toInt();
                        final minutes = ((remainingTime - 1) ~/ 60)
                            .toString()
                            .padLeft(2, '0');
                        final seconds = ((remainingTime - 1) % 60)
                            .toString()
                            .padLeft(2, '0');
                        final timeFormat = '$minutes:$seconds';
                        return Text(timeFormat);
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Container(
                              width: 6,
                              height: 6,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: "Didn't receive your code?",
                            style: ThemeText.headingAmountPaid,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Resend', style: ThemeText.headingText),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: isFormFilled
                            ? const Color(0xffFF7F00)
                            : const Color(0xffDFDFDF)),
                    onPressed: () {
                      final isValidForm = _formKey.currentState!.validate();
                      if (isValidForm) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPassword(),
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
        ),
      ),
    );
  }

  Form inputOtp(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 68,
            width: 64,
            decoration: BoxDecoration(
                color: const Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(8)),
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  setState(() {
                    isFormFilled = _inputPin1Controller.text.isNotEmpty &&
                        _inputPin2Controller.text.isNotEmpty &&
                        _inputPin3Controller.text.isNotEmpty &&
                        _inputPin4Controller.text.isNotEmpty;
                  });
                }
              },
              onSaved: (pin1) {},
              controller: _inputPin1Controller,
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          Container(
            height: 68,
            width: 64,
            decoration: BoxDecoration(
                color: const Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(8)),
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  setState(() {
                    isFormFilled = _inputPin1Controller.text.isNotEmpty &&
                        _inputPin2Controller.text.isNotEmpty &&
                        _inputPin3Controller.text.isNotEmpty &&
                        _inputPin4Controller.text.isNotEmpty;
                  });
                }
              },
              onSaved: (pin2) {},
              controller: _inputPin2Controller,
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          Container(
            height: 68,
            width: 64,
            decoration: BoxDecoration(
                color: const Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(8)),
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  setState(() {
                    isFormFilled = _inputPin1Controller.text.isNotEmpty &&
                        _inputPin2Controller.text.isNotEmpty &&
                        _inputPin3Controller.text.isNotEmpty &&
                        _inputPin4Controller.text.isNotEmpty;
                  });
                }
              },
              onSaved: (pin3) {},
              controller: _inputPin3Controller,
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          Container(
            height: 68,
            width: 64,
            decoration: BoxDecoration(
                color: const Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(8)),
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  setState(() {
                    isFormFilled = _inputPin1Controller.text.isNotEmpty &&
                        _inputPin2Controller.text.isNotEmpty &&
                        _inputPin3Controller.text.isNotEmpty &&
                        _inputPin4Controller.text.isNotEmpty;
                  });
                }
              },
              onSaved: (pin4) {},
              controller: _inputPin4Controller,
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
