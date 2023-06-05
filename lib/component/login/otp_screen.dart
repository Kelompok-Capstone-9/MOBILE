import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../themes/color_style.dart';
import 'reset_password_screen.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

final pinController = TextEditingController();
final _formKey = GlobalKey<FormState>();
final focusNode = FocusNode();
bool isOTPFilled = false;

class _OTPScreenState extends State<OTPScreen> {
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color(0xffFF7F00);
    final defaultPinTheme = PinTheme(
      textStyle: ThemeText.headingRupiah,
      height: 68,
      width: 68,
      decoration: BoxDecoration(
          color: const Color(0xffE6E6E6),
          borderRadius: BorderRadius.circular(8)),
    );

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
                formOTP(defaultPinTheme, focusedBorderColor),
                const SizedBox(
                  height: 24,
                ),
                timeInputOTP(context),
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
                        backgroundColor: isOTPFilled
                            ? ColorsTheme.activeButton
                            : ColorsTheme.inActiveButton),
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
                          color: isOTPFilled
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
        ),
      ),
    );
  }

  Widget formOTP(PinTheme defaultPinTheme, Color focusedBorderColor) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                setState(() {
                  isOTPFilled = pinController.text.isNotEmpty;
                });
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget timeInputOTP(BuildContext context) {
    return Row(
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
          endTime: DateTime.now().millisecondsSinceEpoch + (1 * 60 * 1000),
          onEnd: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Time Out',
                  style: ThemeText.heading2,
                ),
                backgroundColor: ColorsTheme.activeButton,
              ),
            );
          },
          widgetBuilder: (_, CurrentRemainingTime? time) {
            if (time == null) {
              return const Text('00:00');
            }
            int remainingTime =
                (time.min ?? 0).toInt() * 60 + (time.sec ?? 0).toInt();
            final minutes =
                ((remainingTime - 1) ~/ 60).toString().padLeft(2, '0');
            final seconds =
                ((remainingTime - 1) % 60).toString().padLeft(2, '0');
            final timeFormat = '$minutes:$seconds';
            return Text(timeFormat);
          },
        ),
      ],
    );
  }
}
