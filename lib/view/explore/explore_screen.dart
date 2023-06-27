import 'package:flutter/material.dart';
import 'package:gofit_apps/component/calendar.dart';
import 'package:gofit_apps/component/filter_box.dart';
import 'package:gofit_apps/model/gym.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/component/calendar/calendar_screen.dart';
import 'package:gofit_apps/component/explore/gym_card.dart';

import 'package:gofit_apps/view/filter/filter_screen.dart';
import 'package:gofit_apps/view_model/booking_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../component/search/search_gym_screen.dart';
import '../../component/search/search_loc_screen.dart';

class ExploreScreen extends StatefulWidget {
  var statusPencarian;

  var statusPencarianLokasi;

  ExploreScreen({
    Key? key,
    this.statusPencarian = '',
    this.statusPencarianLokasi = '',
  }) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String hasilConvert = '';

  final DateFormat _dateFormat = DateFormat('EEEE, d MMMM yyyy');
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      selectedDate = today;
      String tanggalStr = DateFormat("yyyy-MM-dd").format(today);
      hasilConvert = tanggalStr;

      // print(selectedDate);
      // print(tanggalStr);
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
          title: Text('Explore', style: ThemeText.heading1),
          backgroundColor: ColorsTheme.bgScreen),
      body: Consumer<BookingProvider>(
        builder: (context, gympProvider, _) => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: const BoxDecoration(
                color: ColorsTheme.bgScreen,
              ),
              child: SearchSection(),
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
                            _dateFormat.format(selectedDate),
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
                              Consumer<BookingProvider>(
                                  builder: (context, value, child) =>
                                      Calendar(jumlahRowCalendar: 0)),
                              const Divider(
                                color: ColorsTheme.divider,
                              ),
                              const SizedBox(height: 12),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CalendarView(),
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
                            FilterBox(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      GymCardList(
                        gymData: gymData,
                        statusPencarian: widget.statusPencarian,
                      ),

                      // print("kosong");
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FilterView()),
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

class SearchSection extends StatefulWidget {
  SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  // @override
  // void dispose() {
  //   searchController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<BookingProvider>(context, listen: false);
    final TextEditingController searchController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchLocView(),
              ),
            );
          },
          child: Container(
            height: 54,
            width: double.infinity,
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
            ),
            decoration: BoxDecoration(
              color: ColorsTheme.searchbox,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your location',
                  style: ThemeText.headingSearchSmall,
                ),
                SizedBox(height: 8),
                Text(
                  prov.statusPencarianLokasi == ""
                      ? 'Enter your location'
                      : prov.statusPencarianLokasi,
                  style: prov.statusPencarianLokasi == ""
                      ? ThemeText.headingSearchBig
                      : ThemeText.headingLocation,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            final prov = Provider.of<BookingProvider>(context, listen: false);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SearchGymView(searchByName: searchController, prov: prov),
              ),
            );
          },
          child: Container(
            height: 54,
            width: double.infinity,
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
            ),
            decoration: BoxDecoration(
              color: ColorsTheme.searchbox,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: ColorsTheme.black,
                ),
                SizedBox(width: 10),
                Text(
                  prov.statusPencarian == ""
                      ? 'Search gym or virtual training'
                      : prov.statusPencarian,
                  style: prov.statusPencarian == ""
                      ? ThemeText.headingSearchBig
                      : ThemeText.headingLocation,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
