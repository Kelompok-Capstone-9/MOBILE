import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorsTheme.white,
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
        leading: Image.asset(
          "assets/images/open-gym.png",
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Open Gym',
                  style: ThemeText.heading2,
                ),
                const SizedBox(height: 8),
                Text(
                  'Onsite Class',
                  style: ThemeText.heading4.copyWith(
                    color: ColorsTheme.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Depok, Jawa Barat",
                  style: ThemeText.heading4.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsTheme.success,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Booked',
                    style: ThemeText.heading4.copyWith(
                      color: ColorsTheme.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
