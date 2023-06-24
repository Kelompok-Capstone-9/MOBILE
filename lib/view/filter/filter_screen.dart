import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/booking_detail/booking_detail.dart';

import '../../component/filters/filter_class.dart';
import '../../view_model/booking_provider.dart';
import 'package:provider/provider.dart';

class FilterView extends StatefulWidget {
  FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

TextEditingController minPriceController = TextEditingController();
TextEditingController maxPriceController = TextEditingController();
int minimumHarga = 0;
int maximumHarga = 0;

class _FilterViewState extends State<FilterView> {
  @override
  void filterRangeHarga() {
    setState(() {
      var _minimumHarga = maximumHarga;
      var _maximumHarga = maximumHarga;
      var _typeClass = maximumHarga;
      print('ini adalah ${minimumHarga}');
      print('ini adalah ${maximumHarga}');
      Provider.of<BookingProvider>(context, listen: false)
          .searchByPriceRange(minimumHarga, maximumHarga);
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<BookingProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
      appBar: AppBar(
          elevation: 0.8,
          title: Text('Filter', style: ThemeText.heading1),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price range',
                          style: ThemeText.heading2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: minPriceController,
                                onChanged: (value) {
                                  minimumHarga = int.parse(value);
                                },
                                onEditingComplete: () {
                                  filterRangeHarga();
                                },
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Minimum price',
                                  labelStyle: ThemeText.heading3.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: ColorsTheme.grey,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 47),
                            const Text('-'),
                            const SizedBox(width: 47),
                            Expanded(
                              child: TextField(
                                controller: maxPriceController,
                                onChanged: (value) {
                                  maximumHarga = int.parse(value);
                                },
                                onEditingComplete: () {
                                  filterRangeHarga();
                                },
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Maximum price',
                                  labelStyle: ThemeText.heading3.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: ColorsTheme.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '0 - 10.000.000',
                      style: ThemeText.headingDescription,
                    )
                  ],
                ),
              ),
              const Divider(color: ColorsTheme.divider),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Type class',
                      style: ThemeText.heading2,
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        ClassFilter(
                          classtype: 'All',
                        ),
                        SizedBox(width: 10),
                        ClassFilter(classtype: 'online'),
                        SizedBox(width: 10),
                        ClassFilter(classtype: 'offline'),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location Range',
                      style: ThemeText.heading2,
                    ),
                    const SizedBox(height: 8),
                    const Column(
                      children: [
                        Row(
                          children: [
                            ClassFilter(classtype: 'Jakarta'),
                            SizedBox(width: 10),
                            ClassFilter(classtype: 'Depok'),
                            SizedBox(width: 10),
                            ClassFilter(classtype: 'Jawa Tengah'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            ClassFilter(classtype: 'Jawa Timur'),
                            SizedBox(width: 10),
                            ClassFilter(classtype: 'Kalimantan'),
                            SizedBox(width: 10),
                            ClassFilter(classtype: 'Sumatera'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          const Divider(color: ColorsTheme.divider),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: ColorsTheme.grey,
                      width: 1,
                    ),
                  ),
                  child: const Icon(Icons.delete_outline),
                ),
                GestureDetector(
                  onTap: () {
                    log("masuk ke detail Booking");
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 272,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorsTheme.accent,
                    ),
                    child: Text(
                      "Apply Settings",
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
