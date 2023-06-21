import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/component/booking_detail/convert.dart';
// import 'package:gofit_apps/model/booking.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/booking_detail/payment_confirmation.dart';
import 'package:gofit_apps/view_model/booking_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/list_detail_dummy.dart';
import '../../view_model/login_provider.dart';

final id = 1;

class BookingDetail extends StatefulWidget {
  final int id;

  const BookingDetail({super.key, required this.id});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

int terceklist = 0;
bool status = false;
int _selectedIndex = 6;
int idPackage = 0;

class _BookingDetailState extends State<BookingDetail> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<BookingProvider>(context, listen: false)
        .bookingDetail(idBooking: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            elevation: 0.8,
            title: Text('Detail information', style: ThemeText.heading1),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // Future.microtask(() =>
                  //     Provider.of<BookingProvider>(context, listen: false)
                  //         .bookingDetail(idBooking: widget.id));
                },
                child: const Icon(Icons.arrow_back, color: Colors.black)),
            backgroundColor: ColorsTheme.bgScreen),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
              height: mediaquery.height,
              child: Consumer<BookingProvider>(builder: (context, bookProv, _) {
                final i = bookProv.dataClass;
                if (bookProv.requestState == RequestState.loaded) {
                  if (i != null) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // type gym online
                          SizedBox(
                              width: mediaquery.width,
                              height: 220,
                              child: Image.asset(
                                  'assets/images/online-class.png',
                                  fit: BoxFit.cover)),
                          // SizedBox(
                          //     width: mediaquery.width,
                          //     height: 220,
                          //     child: Image.asset('assets/images/open-gym.png',
                          //         fit: BoxFit.cover)),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Color(0xffD9D9D9),
                              width: 1.0,
                            ))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 16),
                              child: SizedBox(
                                height: 130,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(i.name, style: ThemeText.heading2),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text('${i.classType} class',
                                        style: ThemeText.heading3),
                                    const SizedBox(height: 10),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_month,
                                              color: ColorsTheme.iconColor,
                                              size: 18,
                                            ),
                                            const SizedBox(width: 12.67),
                                            Text(
                                              formatDate(i.startedAt),
                                              style: ThemeText.heading4,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.push_pin,
                                              color: ColorsTheme.iconColor,
                                              size: 18,
                                            ),
                                            const SizedBox(width: 12.67),

                                            // online class
                                            Text(
                                              i.classType == 'offline'
                                                  ? i.location.name.toString()
                                                  : "Via Zoom",
                                              style: ThemeText.heading4,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 9.33),
                                        SizedBox(
                                          height: 20,
                                          width: mediaquery.width,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: icon.length,
                                              itemBuilder: (context, index) {
                                                return Row(
                                                  children: [icon[index]],
                                                );
                                              }),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Color(0xffD9D9D9),
                              width: 1.0,
                            ))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 16, bottom: 10),
                              child: SizedBox(
                                width: mediaquery.width,
                                height: 82,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Select Package',
                                      style: ThemeText.heading2,
                                    ),
                                    const SizedBox(height: 10),
                                    Wrap(
                                      spacing: 8.0,
                                      children: List<Widget>.generate(
                                        i.classPackages.length,
                                        (int index) {
                                          return ChoiceChip(
                                            backgroundColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Color(0xffFF7F00)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12))),
                                            label: SizedBox(
                                              height: 36,
                                              width: 78,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    formatCurrencyNonLabel(i
                                                        .classPackages[index]
                                                        .price!
                                                        .toInt()),
                                                    style: _selectedIndex !=
                                                            index
                                                        ? ThemeText.headingLabel
                                                        : GoogleFonts
                                                            .josefinSans(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 10,
                                                            color: const Color(
                                                                0xff030303),
                                                          ),
                                                  ),
                                                  Text(
                                                    '/${i.classPackages[index].period.toString()}',
                                                    style: _selectedIndex !=
                                                            index
                                                        ? ThemeText.headingLabel
                                                        : GoogleFonts
                                                            .josefinSans(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 10,
                                                            color: const Color(
                                                                0xff030303),
                                                          ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            selected: _selectedIndex == index,
                                            selectedColor:
                                                const Color(0xffFFA83F),
                                            onSelected: (bool selected) {
                                              setState(() {
                                                if (selected) {
                                                  i.classPackages[index]
                                                      .status = 'true';

                                                  _selectedIndex =
                                                      (selected ? index : 5);
                                                  terceklist = int.parse(i
                                                      .classPackages[index]
                                                      .price
                                                      .toString());
                                                  status = true;
                                                  idPackage = index;
                                                  setState(() {});
                                                } else if (!selected) {
                                                  i.classPackages[index]
                                                      .status = 'false';
                                                  _selectedIndex = 5;
                                                  terceklist = 0;
                                                  status = false;
                                                  idPackage = 0;
                                                  setState(() {});
                                                }
                                              });
                                              log(i.classPackages[index].period
                                                  .toString());

                                              log(terceklist.toString());
                                              log(idPackage.toString());
                                            },
                                          );
                                        },
                                      ).toList(),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Color(0xffD9D9D9),
                                width: 1.0,
                              ))),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 16),
                                  child: SizedBox(
                                      height: 100,
                                      width: mediaquery.width,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('You might get',
                                                style: ThemeText.heading2),
                                            const SizedBox(height: 4),
                                            const SizedBox(height: 10),
                                            Row(children: [
                                              const Icon(Icons.safety_check,
                                                  color: ColorsTheme.iconColor,
                                                  size: 24),
                                              const SizedBox(width: 12.67),
                                              //  online class
                                              Text(
                                                  'Safe exercise with hygiene protocols',
                                                  style: ThemeText.heading3)
                                              //end class
                                              // Text(
                                              //     'Safe exercise with hygiene protocols',
                                              //     style: ThemeText.heading3)
                                            ]),
                                            Row(children: [
                                              const Icon(
                                                  Icons.shopping_bag_outlined,
                                                  color: ColorsTheme.iconColor,
                                                  size: 24),
                                              const SizedBox(width: 14),
                                              Flexible(
                                                child:
                                                    // online class
                                                    Text(
                                                        'Private online mentoring with coach',
                                                        style:
                                                            ThemeText.heading3),
                                                // end class
                                                // Text(
                                                //     'Free all access gym equipment & private mentoringon gym',
                                                //     style: ThemeText.heading3),
                                              )
                                            ])
                                          ])))),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                color: Color(0xffD9D9D9),
                                width: 1.0,
                              ),
                            )),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 16),
                              child: SizedBox(
                                height: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Description class',
                                        style: ThemeText.heading2),
                                    const SizedBox(height: 10),
                                    Text(
                                        '${i.description} (ini dari BE nya kurang panjang deh deskripsinya)',
                                        style: GoogleFonts.josefinSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          // height: 2,
                                          color: const Color(0xff0B0B0B),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]);
                  } else {
                    return const CircularProgressIndicator();
                  }
                } else if (bookProv.requestState == RequestState.error) {
                  return Text("cant get Data");
                } else {
                  return const Text('Unknown error');
                }
              })),
        ),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        color: Colors.black.withOpacity(0.2), width: 1.0))),
            width: mediaquery.width,
            height: 80,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: ThemeText.heading3,
                      ),
                      Text(
                        terceklist != 0 ? formatCurrency(terceklist) : "-",
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
                            final provider = Provider.of<BookingProvider>(
                                context,
                                listen: false);
                            log('masuk ke proses payment (payment confirmation screen)');
                            // nanti pake construcotorx
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentConfirmation(
                                        data: provider.dataClass,
                                        hargaPackage: terceklist,
                                        idPackage: idPackage,
                                        cardType: null,
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
                ])));
  }
}
