import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/view/booking_detail/payment_confirmation.dart';
import 'package:gofit_apps/view/booking_detail/widget/card_pay.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/color_style.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

String _payMethod = "";
int _indexPayment = 6;

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
          elevation: 0.8,
          title: Text('Payment methode', style: ThemeText.heading1),
          leading: const Icon(Icons.arrow_back, color: Colors.black),
          backgroundColor: ColorsTheme.bgScreen),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 360,
              child: ListView.builder(
                  itemCount: paymentMethode.length,
                  itemBuilder: (context, index) {
                    var i = paymentMethode[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio(
                            toggleable: false,
                            activeColor: ColorsTheme.primary600,
                            value: i['type'],
                            groupValue: _payMethod,
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                _payMethod = value.toString();
                                _indexPayment = index;
                              });
                              log(_indexPayment.toString());
                            }),
                        SizedBox(
                          width: 350,
                          height: 90,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  color: i['onTap'] == true
                                      ? Colors.red
                                      : const Color(0xff919191)
                                          .withOpacity(0.6),
                                ),
                              ),
                              elevation: 0.2,
                              color: ColorsTheme.bgScreen,
                              margin: const EdgeInsets.only(right: 20, top: 16),
                              child: CardPay(
                                type: i['type'].toString(),
                                desc: i['desc'].toString(),
                                image: i['image'].toString(),
                              )),
                        ),
                      ],
                    );
                  }),
            ),
            GestureDetector(
              onTap: () {
                log('selesai memilih payment method');
                // kirim data ketika selesai memilih
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentConfirmation(
                            data: _indexPayment,
                          )),
                );
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 328,
                  decoration: BoxDecoration(
                    color: _payMethod != ""
                        ? ColorsTheme.primary600
                        : ColorsTheme.disableColorButton,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Select",
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: _payMethod != ""
                            ? ColorsTheme.colorLight
                            : const Color(0xffB5B5B5)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
