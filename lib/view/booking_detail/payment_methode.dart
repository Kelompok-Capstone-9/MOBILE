import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/view/booking_detail/payment_confirmation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../component/booking_detail/card_pay.dart';
import '../../model/booking.dart';
import '../../themes/color_style.dart';
import '../../view_model/booking_provider.dart';

class PaymentMethod extends StatefulWidget {
  DataClass? data;

  // var data;
  var hargaPackage;

  var idPackage;

  var cardType;

  PaymentMethod({
    super.key,
    required this.data,
    required this.hargaPackage,
    required this.idPackage,
    required this.cardType,
  });

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
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: mediaquery.width,
            height: 350,
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
                              log(value.toString());
                              _payMethod = value.toString();
                              _indexPayment = index;
                            });
                            log(_indexPayment.toString());
                          }),
                      GestureDetector(
                        onTap: () => setState(() {
                          _payMethod = i['type'].toString();
                          _indexPayment = index;
                        }),
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: i['onTap'] == true
                                    ? Colors.red
                                    : const Color(0xff919191).withOpacity(0.6),
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
              final prov = Provider.of<BookingProvider>(context, listen: false);
              // kirim data ketika selesai memilih
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentConfirmation(
                          data: widget.data,
                          cardType: _indexPayment,
                          hargaPackage: widget.hargaPackage,
                          idPackage: widget.idPackage,
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
    );
  }
}
