import 'package:flutter/material.dart';
import 'package:gofit_apps/component/calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/list_detail_dummy.dart';
import '../themes/color_style.dart';
import '../view_model/booking_provider.dart';

class FilterBox extends StatefulWidget {
  const FilterBox({super.key});

  @override
  State<FilterBox> createState() => _FilterBoxState();
}

String terceklist = '';
bool status = false;
int _selectedIndex = 6;

class _FilterBoxState extends State<FilterBox> {
  void _onSelectedWaktu(String waktu) {
    setState(() {
      Provider.of<BookingProvider>(context, listen: false)
          .searchByBoxChips(waktu);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 12.0,
      children: List<Widget>.generate(
        timeSelect.length,
        (int index) {
          return ChoiceChip(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Color(0xffFF7F00)),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            label: SizedBox(
              height: 42,
              width: 80,
              child: Row(
                children: [
                  Image.asset(
                    timeSelect[index]['icon'].toString(),
                    height: 16,
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(timeSelect[index]['time'].toString(),
                          style: ThemeText.headingTimeCategory),
                      SizedBox(height: 5),
                      Text(timeSelect[index]['clock'].toString(),
                          style: ThemeText.subheadingTimeCategory),
                    ],
                  ),
                ],
              ),
            ),
            selected: _selectedIndex == index,
            selectedColor: const Color(0xffFF7F00).withOpacity(.45),
            onSelected: (bool selected) {
              setState(
                () {
                  if (selected) {
                    timeSelect[index]['status'] = true;
                    _selectedIndex = (selected ? index : 5);
                    terceklist = timeSelect[index]['time'].toString();
                    status = true;
                    var a = timeSelect[index]['time'].toString();

                    _onSelectedWaktu(a);
                  } else if (!selected) {
                    timeSelect[index]['status'] = false;
                    _onSelectedWaktu("");

                    _selectedIndex = 5;
                    terceklist = '';
                    status = false;

                    setState(() {});
                  }
                },
              );
            },
          );
        },
      ).toList(),
    );
  }
}
