import 'package:flutter/material.dart';
import 'package:gofit_apps/component/calendar.dart';
import 'package:intl/intl.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../view_model/booking_provider.dart';

class CalendarView extends StatefulWidget {
  var statusPencarian;

  CalendarView({
    super.key,
    this.statusPencarian = '',
  });

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('EEEE, d MMMM yyyy');
  String hasilConvert = '';

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;

      selectedDate = day;
      String tanggalStr = DateFormat("yyyy-MM-dd").format(today);
      hasilConvert = tanggalStr;
      widget.statusPencarian = tanggalStr;
      print('ini tanggal${tanggalStr}');
      Provider.of<BookingProvider>(context, listen: false)
          .searchByName(tanggalStr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
          elevation: 0.8,
          title: Text('Select Date', style: ThemeText.heading1),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date session class / booking',
                    style: ThemeText.heading2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select your date',
                    style: ThemeText.heading3,
                  ),
                ],
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child: Consumer<BookingProvider>(
                  builder: (context, value, child) =>
                      Calendar(jumlahRowCalendar: 43))),
          const Spacer(),
          const Divider(
            color: ColorsTheme.divider,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Date',
                      style: ThemeText.heading3,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _dateFormat.format(selectedDate),
                      style: ThemeText.heading2,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, widget.statusPencarian);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 148,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorsTheme.accent,
                    ),
                    child: Text(
                      "Select",
                      style: ThemeText.heading1.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}
