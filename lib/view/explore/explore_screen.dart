import 'package:flutter/material.dart';
import 'package:gofit_apps/model/gym.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/component/calendar/calendar_screen.dart';
import 'package:gofit_apps/component/explore/gym_card.dart';

import 'package:gofit_apps/view/filter/filter_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  String terceklist = '';
  bool status = false;
  int _selectedIndex = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
          elevation: 0.8,
          title: Text('Explore', style: ThemeText.heading1),
          backgroundColor: ColorsTheme.bgScreen),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: const BoxDecoration(
              color: ColorsTheme.bgScreen,
            ),
            child: const SearchSection(),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                        const SizedBox(width: 18),
                        Text(
                          'Sunday, 30 April 2023',
                          style: ThemeText.headingCalendar,
                        ),
                      ],
                    ),
                    const SizedBox(height: 23),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsTheme.bgScreen,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 12,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            TableCalendar(
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
                              calendarFormat: CalendarFormat.week,
                              selectedDayPredicate: (day) =>
                                  isSameDay(day, today),
                              focusedDay: today,
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2030, 3, 14),
                              onDaySelected: _onDaySelected,
                            ),
                            const Divider(
                              color: ColorsTheme.divider,
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CalendarView(),
                                  ),
                                );
                              },
                              child: Text(
                                'Tampilkan lebih banyak',
                                style: ThemeText.heading3.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 23),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 8.0,
                            children: List<Widget>.generate(
                              timeSelect.length,
                              (int index) {
                                return ChoiceChip(
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      side:
                                          BorderSide(color: Color(0xffFF7F00)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                timeSelect[index]['time']
                                                    .toString(),
                                                style: ThemeText
                                                    .headingTimeCategory),
                                            SizedBox(height: 5),
                                            Text(
                                                timeSelect[index]['clock']
                                                    .toString(),
                                                style: ThemeText
                                                    .subheadingTimeCategory),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  selected: _selectedIndex == index,
                                  selectedColor:
                                      const Color(0xffFF7F00).withOpacity(.45),
                                  onSelected: (bool selected) {
                                    setState(
                                      () {
                                        if (selected) {
                                          timeSelect[index]['status'] = true;
                                          _selectedIndex =
                                              (selected ? index : 5);
                                          terceklist = timeSelect[index]['time']
                                              .toString();
                                          status = true;
                                        } else if (!selected) {
                                          timeSelect[index]['status'] = false;
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
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    GymCardList(gymData: gymData),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilterView()),
          );
        },
        label: const Text('Filter'),
        icon: const Icon(Icons.filter_list_rounded),
        backgroundColor: ColorsTheme.accent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.date,
    required this.time,
    this.isSelected = false,
  });

  final String date;
  final String time;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          date,
          style: ThemeText.labelDay,
        ),
        const SizedBox(height: 16),
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? ColorsTheme.orangelight : ColorsTheme.bgScreen,
          ),
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              time,
              style: ThemeText.labelTime,
            ),
          ),
        ),
      ],
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(right: 8, left: 8, top: 10),
          decoration: BoxDecoration(
            color: ColorsTheme.searchbox,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Your location',
                  style: ThemeText.headingSearchSmall,
                ),
              ),
              TextField(
                style: ThemeText.headingLocation,
                decoration: InputDecoration(
                  hintText: 'Enter your location',
                  filled: true,
                  fillColor: ColorsTheme.searchbox,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelStyle: ThemeText.headingSearchBlack,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 44,
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 2, right: 2, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: ColorsTheme.searchbox,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            style: ThemeText.headingSearchBlack,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 18,
              ),
              hintText: 'Search gym or virtual training',
              hintStyle: ThemeText.headingSearchBig,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
