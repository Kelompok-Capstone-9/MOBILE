import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/gender_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OTPRegistScreen extends StatefulWidget {
  const OTPRegistScreen({Key? key}) : super(key: key);
  @override
  State<OTPRegistScreen> createState() => _OTPRegistScreenState();
}

final pinController = TextEditingController();
final _formKey = GlobalKey<FormState>();
final focusNode = FocusNode();
bool isOTPFilled = false;

class _OTPRegistScreenState extends State<OTPRegistScreen> {
  // @override
  // void dispose() {
  //   pinController.dispose();
  //   focusNode.dispose();
  //   super.dispose();
  // }

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
          elevation: 0.8,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                width: 160,
                height: 120,
                child: Image.asset('assets/images/Picture.png'),
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Email Verification',
                      style: ThemeText.headingLogin,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'We sent an 4 digit code to your email',
                      style: ThemeText.headingSub3,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'email@gmail.com',
                      style: ThemeText.headingSub3,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
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
              const SizedBox(height: 44),
              GestureDetector(
                onTap: () {
                  // log('selesai memilih payment method');
                  // // kirim data ketika selesai memilih
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseGenderScreen()),
                  );
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 328,
                    decoration: BoxDecoration(
                      color: isOTPFilled != false
                          ? ColorsTheme.activeButton
                          : ColorsTheme.inActiveButton,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Verify & Process",
                      style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: isOTPFilled != false
                              ? ColorsTheme.activeText
                              : const Color(0xffB5B5B5)),
                    )),
              ),
            ],
          ),
        )),
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
          endTime: DateTime.now().millisecondsSinceEpoch + (10 * 60 * 1000),
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