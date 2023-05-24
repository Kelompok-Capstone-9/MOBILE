import 'package:flutter/material.dart';
import 'package:gofit_apps/model/gym.dart';
import 'package:gofit_apps/themes/color_style.dart';

class GymCardList extends StatelessWidget {
  const GymCardList({
    Key? key,
    required this.gymData,
  }) : super(key: key);

  final List<GymData> gymData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: gymData.length,
      itemBuilder: (BuildContext context, int index) {
        final GymData gymDataItem = gymData[index];
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorsTheme.bgScreen,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            minVerticalPadding: 10,
            leading: Image.asset(
              gymDataItem.imageurl,
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      gymDataItem.gymName,
                      style: ThemeText.heading2,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      gymDataItem.location,
                      style: ThemeText.heading4.copyWith(
                        color: ColorsTheme.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${gymDataItem.status} class",
                      style: ThemeText.heading4.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Rp ${gymDataItem.priceLow} - ${gymDataItem.priceHigh}",
                      style: ThemeText.heading2.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorsTheme.accent,
                  ),
                  child: Text(
                    "Book",
                    style: ThemeText.heading4.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
