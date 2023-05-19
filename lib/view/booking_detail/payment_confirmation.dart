import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentConfirmation extends StatefulWidget {
  const PaymentConfirmation({super.key});

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
          leading: const Icon(Icons.arrow_back, color: Colors.black),
          backgroundColor: ColorsTheme.bgScreen),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: mediaquery.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 16, right: 16),
                child: Center(
                  child: Card(
                    shadowColor: Colors.black.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                    child: SizedBox(
                      // width: 328,
                      height: 90,
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16),
                            child: SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.asset('assets/images/open-gym.png',
                                    fit: BoxFit.contain)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 13.5, bottom: 13.5),
                            child: SizedBox(
                              width: 140,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
              ),
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
                child: Column(
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
                      trailing: Text(
                        'Offline mentoring',
                        style: ThemeText.heading5,
                      ),
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
                  ],
                ),
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
              ),
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
                    ),
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
                    ),
                    Center(
                        child: Text(
                            '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w100,
                              fontSize: 20,
                              color: const Color(0xff0B0B0B),
                            ))),
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
                    Card(
                        color: ColorsTheme.bgScreen,
                        shadowColor: Colors.black.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: Color(0xff919191),
                          ),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 21.0, bottom: 21, left: 18),
                          child: SizedBox(
                            child: Row(children: [
                              const Icon(
                                FontAwesomeIcons.wallet,
                                color: Color(0xff00007A),
                                size: 30,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Select payment',
                                style: ThemeText.heading2,
                              )
                            ]),
                          ),
                        )),
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
            Container(
                alignment: Alignment.center,
                height: 38,
                width: 176,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(0, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xffFF7F00))),
                child: Text(
                  "Cancel Order",
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: const Color(0xffFF7F00)),
                )),
            Container(
                alignment: Alignment.center,
                height: 38,
                width: 176,
                decoration: BoxDecoration(
                    color: const Color(0xffFF7F00),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Continue to payment",
                  style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
