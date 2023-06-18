import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      selectedDate = day;
    });
  }

  final DateFormat _dateFormat = DateFormat("MMMM d'th'");

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
            child: TableCalendar(
              locale: 'en_US',
              rowHeight: 43,
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
                weekendTextStyle: ThemeText.heading5.copyWith(
                  color: ColorsTheme.grey,
                ),
                outsideTextStyle: ThemeText.heading5.copyWith(
                  color: ColorsTheme.grey,
                ),
                todayTextStyle: ThemeText.heading5,
                defaultTextStyle: ThemeText.heading5,
                selectedTextStyle: ThemeText.heading5,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
            ),
          ),
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
                Container(
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
              ],
            ),
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}
