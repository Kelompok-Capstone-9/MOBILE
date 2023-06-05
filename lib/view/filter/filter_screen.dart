import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/booking_detail/booking_detail.dart';

import '../../component/filters/filter_class.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
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
                        ClassFilter(classtype: 'All'),
                        SizedBox(width: 10),
                        ClassFilter(classtype: 'Online'),
                        SizedBox(width: 10),
                        ClassFilter(classtype: 'Onsite'),
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
                            ClassFilter(classtype: 'DKI Jakarta'),
                            SizedBox(width: 10),
                            ClassFilter(classtype: 'Jawa Barat'),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookingDetail()));
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
