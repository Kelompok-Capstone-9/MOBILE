import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/booking_detail/booking_detail.dart';
import 'package:google_fonts/google_fonts.dart';

import '../payment_confirmation.dart';

class WidgetTotal extends StatelessWidget {
  const WidgetTotal({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    color: Colors.black.withOpacity(0.2), width: 1.0))),
        width: mediaquery.width,
        height: 80,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: ThemeText.heading3,
              ),
              Text(
                terceklist != 0 ? terceklist.toString() : "-",
                style: ThemeText.headingRupiah,
              ),
            ],
          ),
          (terceklist == 0 && status == false)
              ? Container(
                  alignment: Alignment.center,
                  height: 38,
                  width: 148,
                  decoration: BoxDecoration(
                      color: const Color(0xffDFDFDF),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Booking Now !",
                    style: ThemeText.headingBookNow,
                  ))
              : GestureDetector(
                  onTap: () {
                    log('masuk ke proses payment (payment confirmation screen)');
                    // nanti pake construcotorx
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentConfirmation(
                                data: null,
                              )),
                    );
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 38,
                      width: 148,
                      decoration: BoxDecoration(
                          color: const Color(0xffFF7F00),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("Booking Now !",
                          style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white))),
                )
        ]));
  }
}
