import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentInformation extends StatefulWidget {
  const PaymentInformation({super.key});

  @override
  State<PaymentInformation> createState() => _PaymentInformationState();
}

String status = '';

class _PaymentInformationState extends State<PaymentInformation> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          // title: Text('Payment methode', style: ThemeText.heading1),
          leading: const Icon(Icons.arrow_back, color: Colors.black),
          backgroundColor: ColorsTheme.bgScreen),
      backgroundColor: ColorsTheme.bgScreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 254,
            width: mediaquery.width,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                    child: Icon(
                      FontAwesomeIcons.stopwatch,
                      color: ColorsTheme.primary600,
                      size: 40,
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Payment deadline',
                      style: ThemeText.heading5,
                    )),
                // waktu dl
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: Text('02:59:52',
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: ColorsTheme.primary600,
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
              color: ColorsTheme.bgScreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: const Color(0xff919191).withOpacity(0.6),
                  )),
              child: SizedBox(
                width: mediaquery.width,
                // height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 10),
                        child: Text(
                          'Make payment immediatelly',
                          style: ThemeText.heading3,
                        )),
                    Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                            '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w200,
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0, left: 16, top: 8.0),
                        child: Text(
                          'Total to be paid',
                          style: ThemeText.heading3,
                        )),
                    Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                        child: Text(
                          'Rp 75.000',
                          style: ThemeText.headingPaymentMethod,
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(top: 12, bottom: 8, left: 16),
                    child: Text(
                      'How to pay with e wallet',
                      style: ThemeText.heading6,
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                        width: mediaquery.width,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xffE6E6E6),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          ' 1. Click Pay Now \n 2.The e wallet application will automatically open \n 3. Confirmation payment in application \n 4. Payment success',
                          style: ThemeText.heading4,
                        )))
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        width: mediaquery.width,
        height: 80,
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Container(
                alignment: Alignment.center,
                height: 38,
                width: 360,
                decoration: BoxDecoration(
                  color: ColorsTheme.primary600,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Pay now",
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: ColorsTheme.colorLight),
                )),
          ),
        ),
      ),
    );
  }
}
