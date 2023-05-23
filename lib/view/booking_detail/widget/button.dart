// ignore_for_file: must_be_immutable

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

class ButtonFilledSmall extends StatelessWidget {
  String textButton;
  ButtonFilledSmall({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 38,
        width: 176,
        decoration: BoxDecoration(
            color: const Color(0xffFF7F00),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          textButton,
          style: GoogleFonts.josefinSans(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.white,
          ),
        ));
  }
}

class ButtonFilledSmallBackPayment extends StatelessWidget {
  String textButton;
  ButtonFilledSmallBackPayment({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 38,
        width: 150,
        decoration: BoxDecoration(
            color: const Color(0xffFF7F00),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          textButton,
          style: GoogleFonts.josefinSans(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.white,
          ),
        ));
  }
}

class ButtonOutlineSmallCancelPayment extends StatelessWidget {
  String textButton;
  ButtonOutlineSmallCancelPayment({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 38,
        width: 150,
        decoration: BoxDecoration(
            color: const Color.fromARGB(0, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffFF7F00))),
        child: Text(
          textButton,
          style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: const Color(0xffFF7F00)),
        ));
  }
}

class ButtonOutlineSmall extends StatelessWidget {
  String textButton;
  ButtonOutlineSmall({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 38,
        width: 176,
        decoration: BoxDecoration(
            color: const Color.fromARGB(0, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffFF7F00))),
        child: Text(
          textButton,
          style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: const Color(0xffFF7F00)),
        ));
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
