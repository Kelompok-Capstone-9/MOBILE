import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/register/join_member_screen.dart';
import 'dart:developer';

import 'package:gofit_apps/view/register/widget/card_pay.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);
  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

String _payMethod = "";
int _indexPayment = 6;

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0.8,
          title: Text('Payment Method', style: ThemeText.heading1),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      body: Column(
        children: [
          SizedBox(
            width: mediaquery.width,
            height: 350,
            child: ListView.builder(
              itemBuilder: ((context, index) {
                var i = paymentMethode[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Radio(
                        toggleable: false,
                        activeColor: ColorsTheme.activeButton,
                        value: i['type'],
                        groupValue: _payMethod,
                        onChanged: (value) {
                          setState(() {
                            _payMethod = value.toString();
                            _indexPayment = index;
                          });
                          log(_indexPayment.toString());
                        }),
                    Card(
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
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: HoverButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onpressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const JoinMemberScreen()));
              },
              color: ColorsTheme.activeButton,
              hoverColor: const Color(0xffFF7F00),
              hoverTextColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Continue',
                  style: ThemeText.heading1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
