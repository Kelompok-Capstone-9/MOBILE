import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../themes/color_style.dart';

// ignore: must_be_immutable
class ButtonPay extends StatelessWidget {
  String textButton;

  ButtonPay({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          height: 38,
          width: 360,
          decoration: BoxDecoration(
            color: ColorsTheme.primary600,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            textButton,
            style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: ColorsTheme.colorLight),
          )),
    );
  }
}

// ignore: must_be_immutable
class ButtonPayWithDetail extends StatelessWidget {
  String textButton;
  String id;

  ButtonPayWithDetail({super.key, required this.textButton, required this.id});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          height: 38,
          width: 360,
          decoration: BoxDecoration(
            color: ColorsTheme.primary600,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            textButton,
            style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: ColorsTheme.colorLight),
          )),
    );
  }
}
