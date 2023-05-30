import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/list_detail_dummy.dart';
import 'widget/package_select.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({super.key});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

int terceklist = 0;
bool status = false;
int _selectedIndex = 5;

// TODO :  kasih parameter apakah ONLINE class atau OFFLINE class;
class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            elevation: 0.8,
            title: Text('Detail information', style: ThemeText.heading1),
            leading: const Icon(Icons.arrow_back, color: Colors.black),
            backgroundColor: ColorsTheme.bgScreen),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: mediaquery.height,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // type gym online
                  SizedBox(
                      width: mediaquery.width,
                      height: 220,
                      child: Image.asset('assets/images/online-class.png',
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
                            // type online class
                            Text('Mr. Jhons', style: ThemeText.heading2),
                            //end class

                            // Text('Open Gym - Private coach',
                            //     style: ThemeText.heading2),
                            const SizedBox(
                              height: 4,
                            ),
                            // online class
                            Text('Online Class', style: ThemeText.heading3),

                            // end class
                            // Text('Onsite Class', style: ThemeText.heading3),
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
                                      'April 30th, 5AM - 12PM',
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
                                      'Via Zoom',
                                      style: ThemeText.heading4,
                                    ),
                                    // end class
                                    // Text(
                                    //   'Depok, Jawa Barat, 2.0 Km',
                                    //   style: ThemeText.heading4,
                                    // ),
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
                      padding:
                          const EdgeInsets.only(top: 10, left: 16, bottom: 10),
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
                                package.length,
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
                                            'Rp. ${package[index]['harga'].toString()}',
                                            style: _selectedIndex != index
                                                ? ThemeText.headingLabel
                                                : GoogleFonts.josefinSans(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10,
                                                    color:
                                                        const Color(0xff030303),
                                                  ),
                                          ),
                                          Text(
                                            package[index]['type'].toString(),
                                            style: _selectedIndex != index
                                                ? ThemeText.headingLabel
                                                : GoogleFonts.josefinSans(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10,
                                                    color:
                                                        const Color(0xff030303),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // ignore: unrelated_type_equality_checks

                                    selected: _selectedIndex == index,
                                    selectedColor: const Color(0xffFFA83F),

                                    onSelected: (bool selected) {
                                      setState(() {
                                        if (selected) {
                                          package[index]['status'] = true;
                                          _selectedIndex =
                                              (selected ? index : 5);
                                          terceklist = int.parse(package[index]
                                                  ['harga']
                                              .toString());
                                          status = true;
                                        } else if (!selected) {
                                          package[index]['status'] = false;
                                          _selectedIndex = 5;
                                          terceklist = 0;
                                          status = false;

                                          setState(() {});
                                        }
                                      });
                                      // print('uncek${package[index]['status']}');
                                      log(package[index].toString());
                                      log(package[index]['status'].toString());
                                      log(terceklist.toString());
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
                          padding: const EdgeInsets.only(top: 10, left: 16),
                          child: SizedBox(
                              height: 100,
                              width: mediaquery.width,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      const Icon(Icons.shopping_bag_outlined,
                                          color: ColorsTheme.iconColor,
                                          size: 24),
                                      const SizedBox(width: 14),
                                      Flexible(
                                        child:
                                            // online class
                                            Text(
                                                'Private online mentoring with coach',
                                                style: ThemeText.heading3),
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
                                "Sometimes life gets in the way of making our 3-6 CrossFit. Classes a week. Sometimes we miss a particular workout, benchmark, or lift that we really want to make up. Sometimes we want a little extra time outside of class to work on skills, drills, technique, or perform work that’s been xassigned to you from your Coach. One distinctive feature of the Jim class is its focus on collaborative learning. Jim encourages students to work together in groups, share ideas, and solve problems collectively. This helps build social skills, problem-solving abilities, and critical thinking. Enter... Open Gym.",
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
                ]),
          ),
        ),
        bottomNavigationBar: const WidgetTotal());
  }
}
