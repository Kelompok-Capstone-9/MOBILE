import 'dart:developer';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/booking_detail/booking_detail.dart';
import 'package:gofit_apps/view/booking_detail/payment_information.dart';
import 'package:gofit_apps/view/booking_detail/payment_methode.dart';
import 'package:gofit_apps/view/booking_detail/widget/button.dart';
import 'package:gofit_apps/view/booking_detail/widget/card.dart';
import 'package:gofit_apps/view/booking_detail/widget/card_pay.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentConfirmation extends StatefulWidget {
  var data;

  PaymentConfirmation({super.key, required this.data});

  @override
  State<PaymentConfirmation> createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
          elevation: 0.8,
          title: Text('Payment confirmation', style: ThemeText.heading1),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: mediaquery.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              contoh().animate().fadeIn().slideX().fadeIn(),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking Details',
                      style: ThemeText.heading2,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Color(0xffD9D9D9),
                    width: 1.0,
                  ),
                )),
                child: listV().animate().slideX().fadeIn(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment details',
                      style: ThemeText.heading2,
                    ),
                  ],
                ),
              ).animate().moveY().fadeIn(),
              SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                      child: ListTile(
                        title: Text(
                          'Price',
                          style: ThemeText.heading3,
                        ),
                        trailing: Text(
                          'Rp 150.000',
                          style: ThemeText.heading5,
                        ),
                      ),
                    ).animate().fadeIn().shake(),
                    SizedBox(
                      height: 40,
                      child: ListTile(
                        title: Text(
                          'Discount',
                          style: ThemeText.heading3,
                        ),
                        trailing: Text(
                          'Rp 0',
                          style: ThemeText.heading5,
                        ),
                      ),
                    ).animate().fadeIn().shake(),
                    Center(
                        child: Text(
                            '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w100,
                              fontSize: 20,
                              color: const Color(0xff0B0B0B),
                            ))).animate().fadeIn().shake(),
                    SizedBox(
                      height: 25,
                      child: ListTile(
                        title: Text(
                          'Total payments',
                          style: ThemeText.heading3,
                        ),
                        trailing: Text(
                          'Rp 150.000',
                          style: ThemeText.heading5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 16, bottom: 10, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment methode',
                      style: ThemeText.heading2,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        log('masuk ke screen pilih payment methode');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentMethod()),
                        );
                      },
                      child: widget.data == null
                          ? CardWidget(
                              icon: FontAwesomeIcons.wallet,
                              keterangan: "Select payment")
                          : SizedBox(
                              // width: 350,
                              height: 90,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(
                                      color: const Color(0xff919191)
                                          .withOpacity(0.6),
                                    ),
                                  ),
                                  elevation: 5,
                                  color: ColorsTheme.bgScreen,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CardPay(
                                      type: paymentMethode[widget.data]['type']
                                          .toString(),
                                      desc: paymentMethode[widget.data]['desc']
                                          .toString(),
                                      image: paymentMethode[widget.data]
                                              ['image']
                                          .toString(),
                                    ),
                                  )),
                            ),
                    )
                        .animate()
                        .saturate()
                        .shimmer()
                        .fadeIn()
                        .effect(duration: Duration(seconds: 6)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Change payment',
                          style: ThemeText.headingChangePayment,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.black.withOpacity(0.2),
              width: 1.0,
            ),
          ),
        ),
        width: mediaquery.width,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                log('cancel oreder');
                showDialog(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: ColorsTheme.bgScreen,
                          insetPadding: EdgeInsets.only(left: 17, right: 17),
                          content: SizedBox(
                            width: 500,
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 8, top: 16),
                                  child: SizedBox(
                                      width: 80,
                                      height: 52,
                                      child: Image.asset(
                                        'assets/images/alert-dialog.png',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Text(
                                  'Are you sure to cancel this order ?',
                                  style: ThemeText.heading6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    width: mediaquery.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              log('close window');
                                              // Navigator.pop(context);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const BookingDetail()),
                                              );
                                            },
                                            child:
                                                ButtonOutlineSmallCancelPayment(
                                                    textButton: 'Yes, sure')),
                                        GestureDetector(
                                            onTap: () {
                                              log('close window');
                                              Navigator.pop(context);
                                            },
                                            child: ButtonFilledSmallBackPayment(
                                                textButton: 'Back to pay')),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ));
                    });
              },
              child: ButtonOutlineSmall(textButton: 'Cancel Order'),
            ),
            GestureDetector(
              onTap: () {
                log('ke proses payment');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentInformation()),
                );
              },
              child: ButtonFilledSmall(textButton: 'Continue to payment'),
            )
          ],
        ),
      ),
    );
  }

  Column listV() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          horizontalTitleGap: 0,
          leading: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
          title: Text(
            'Booking Type',
            style: ThemeText.heading3,
          ),
          trailing: Text(
            'Daily',
            style: ThemeText.heading5,
          ),
        ),
        ListTile(
          horizontalTitleGap: 1,
          leading: const Icon(
            Icons.tv,
            color: Colors.black,
          ),
          title: Text(
            'Class type',
            style: ThemeText.heading3,
          ),
          trailing:
              // online class
              Text(
            'Online mentoring',
            style: ThemeText.heading5,
          ),
          // end class
          // Text(
          //   'Offline mentoring',
          //   style: ThemeText.heading5,
          // ),
        ),
        ListTile(
          horizontalTitleGap: 1,
          leading: const Icon(
            Icons.calendar_month,
            color: Colors.black,
          ),
          title: Text(
            'Periode of booking',
            style: ThemeText.heading3,
          ),
          trailing: Text(
            '30 Apr 2023',
            style: ThemeText.heading5,
          ),
        ),
        ListTile(
          horizontalTitleGap: 1,
          leading: const Icon(
            Icons.timer,
            color: Colors.black,
          ),
          title: Text(
            'Time session',
            style: ThemeText.heading3,
          ),
          trailing: Text(
            '5AM - 12PM',
            style: ThemeText.heading5,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(
        //       top: 14, bottom: 12, left: 16, right: 16),
        //   child: CardWidget(
        //       icon: FontAwesomeIcons.jugDetergent,
        //       keterangan: "Grab your offers"),
        // ),
      ],
    );
  }

  Padding contoh() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 16, right: 16),
      child: Center(
        child: Card(
          shadowColor: Colors.black.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: ColorsTheme.bgScreen,
          elevation: 5,
          child: SizedBox(
            // width: 328,
            height: 90,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: SizedBox(
                      width: 70,
                      height: 70,
                      child:
                          // online class
                          ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('assets/images/online-class.png',
                            fit: BoxFit.cover),
                      )

                      // endd class
                      //  Image.asset('assets/images/open-gym.png',
                      //     fit: BoxFit.contain)
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13.5, bottom: 13.5),
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Open Gym',
                          style: ThemeText.heading2,
                        ),
                        Text(
                          'Depok, Jawa Barat',
                          style: ThemeText.headingPaymentDescription,
                        ),
                        Text(
                          '2.0 Km',
                          style: ThemeText.headingPaymentDescription,
                        ),
                        Text(
                          'Rp. 20.0000',
                          style: ThemeText.heading2,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
