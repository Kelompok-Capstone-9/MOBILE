import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../themes/color_style.dart';
import '../view_model/booking_provider.dart';

class Calendar extends StatefulWidget {
  int jumlahRowCalendar;

  Calendar({super.key, required this.jumlahRowCalendar});

  @override
  State<Calendar> createState() => _CalendarState();
}

DateTime today = DateTime.now();
DateTime selectedDate = DateTime.now();
String hasilConvert = '';
// String dateString = widget.statusPencarian;
// DateTime convertStringToDate = DateTime.parse(statusPencarian);
final DateFormat _dateFormat = DateFormat('EEEE, d MMMM yyyy');

class _CalendarState extends State<Calendar> {
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;

      selectedDate = day;
      String tanggalStr = DateFormat("yyyy-MM-dd").format(today);
      hasilConvert = tanggalStr;
      // widget.statusPencarian = tanggalStr;
      print('ini tanggal${tanggalStr}');
      Provider.of<BookingProvider>(context, listen: false)
          .searchByName(tanggalStr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (context, value, child) => TableCalendar(
        locale: 'en_US',
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: ThemeText.heading5,
          weekendStyle: ThemeText.heading5,
        ),
        headerStyle: HeaderStyle(
          titleTextStyle: ThemeText.heading1,
          formatButtonVisible: false,
          titleCentered: true,
        ),
        calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          todayDecoration: BoxDecoration(
            color: ColorsTheme.accent.withOpacity(.45),
            shape: BoxShape.circle,
          ),
          selectedDecoration: const BoxDecoration(
            color: ColorsTheme.accent,
            shape: BoxShape.circle,
          ),
          weekNumberTextStyle: ThemeText.heading5,
          weekendTextStyle: ThemeText.heading5,
          outsideTextStyle: ThemeText.heading5,
          todayTextStyle: ThemeText.heading5,
          defaultTextStyle: ThemeText.heading5,
          selectedTextStyle: ThemeText.heading5,
        ),
        headerVisible: false,
        availableGestures: AvailableGestures.none,
        calendarFormat: widget.jumlahRowCalendar == 43
            ? CalendarFormat.month
            : CalendarFormat.week,
        selectedDayPredicate: (day) => isSameDay(day, selectedDate),
        focusedDay: today,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        onDaySelected: _onDaySelected,
      ),
    );
  }
}
