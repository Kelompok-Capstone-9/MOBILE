import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class ActivitiesCard extends StatelessWidget {
  const ActivitiesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsTheme.bgActivites,
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Open Gym',
            style: ThemeText.heading1,
          ),
          const SizedBox(height: 16),
          Text(
            'FIT HUB Indonesia - Gading Serpong',
            style: ThemeText.heading4,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 16,
                color: Colors.orange,
              ),
              const SizedBox(width: 8),
              Text(
                '27 Apr from 21.00 - 23.00',
                style: ThemeText.heading4,
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Colors.orange,
              ),
              const SizedBox(width: 8),
              Text(
                'Online via Zoom',
                style: ThemeText.heading4,
              )
            ],
          )
        ],
      ),
    );
  }
}
