import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/list_detail_dummy.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({super.key});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

int terceklist = 0;
int _selectedIndex = 5;

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
              SizedBox(
                  width: mediaquery.width,
                  height: 220,
                  child: Image.asset('assets/images/open-gym.png',
                      fit: BoxFit.cover)),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    //                   <--- left side
                    color: Color(0xffD9D9D9),
                    width: 1.0,
                  ),
                )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 16),
                  child: SizedBox(
                    height: 122,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Open Gym - Private coach',
                            style: ThemeText.heading2),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('Onsite Class', style: ThemeText.heading3),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
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
                                Icon(
                                  Icons.push_pin,
                                  color: ColorsTheme.iconColor,
                                  size: 18,
                                ),
                                SizedBox(width: 12.67),
                                Text(
                                  'Depok, Jawa Barat, 2.0 Km',
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
                                  physics: NeverScrollableScrollPhysics(),
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
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    //                   <--- left side
                    color: Color(0xffD9D9D9),
                    width: 1.0,
                  ),
                )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 16, bottom: 10),
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
                        SizedBox(height: 10),
                        Wrap(
                          spacing: 8.0,
                          children: List<Widget>.generate(
                            package.length,
                            (int index) {
                              return ChoiceChip(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xffFF7F00)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                label: SizedBox(
                                  height: 36,
                                  width: 78,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Rp. ${package[index]['harga'].toString()}',
                                        style: _selectedIndex != index
                                            ? ThemeText.headingLabel
                                            : GoogleFonts.josefinSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                                color: const Color(0xff030303),
                                              ),
                                      ),
                                      Text(
                                        package[index]['type'].toString(),
                                        style: _selectedIndex != index
                                            ? ThemeText.headingLabel
                                            : GoogleFonts.josefinSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                                color: const Color(0xff030303),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                                // ignore: unrelated_type_equality_checks

                                selected: _selectedIndex == index,
                                selectedColor: Color(0xffFFA83F),

                                onSelected: (bool selected) {
                                  setState(() {
                                    if (selected) {
                                      package[index]['status'] = true;
                                      _selectedIndex = (selected ? index : 5);
                                      terceklist = int.parse(
                                          package[index]['harga'].toString());
                                    } else if (!selected) {
                                      package[index]['status'] = false;
                                      _selectedIndex = 5;
                                      terceklist = 0;

                                      setState(() {});
                                    }
                                  });
                                  print('uncek${package[index]['status']}');
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
                    //                   <--- left side
                    color: Color(0xffD9D9D9),
                    width: 1.0,
                  ),
                )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 16),
                  child: SizedBox(
                    height: 100,
                    width: mediaquery.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('You might get', style: ThemeText.heading2),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.safety_check,
                              color: ColorsTheme.iconColor,
                              size: 24,
                            ),
                            const SizedBox(width: 12.67),
                            Text(
                              'Safe exercise with hygiene protocols',
                              style: ThemeText.heading3,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: ColorsTheme.iconColor,
                              size: 24,
                            ),
                            SizedBox(width: 14),
                            Flexible(
                              child: Text(
                                'Free all access gym equipment & private mentoringon gym',
                                style: ThemeText.heading3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    //                   <--- left side
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
                        Text('Description class', style: ThemeText.heading2),
                        SizedBox(height: 10),
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
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white),
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
                  terceklist != 0 ? terceklist.toString() : "-",
                  style: ThemeText.headingRupiah,
                ),
              ],
            ),
            terceklist == 0
                ? Container(
                    alignment: Alignment.center,
                    height: 38,
                    width: 148,
                    decoration: BoxDecoration(
                        color: Color(0xffDFDFDF),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Booking Now !",
                      style: ThemeText.headingBookNow,
                    ))
                : Container(
                    alignment: Alignment.center,
                    height: 38,
                    width: 148,
                    decoration: BoxDecoration(
                        color: Color(0xffFF7F00),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Booking Now",
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
