import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class TimeCategory extends StatelessWidget {
  const TimeCategory({
    super.key,
    required this.icon,
    required this.time,
    required this.clock,
    this.isSelected = false,
  });

  final String icon;
  final String time;
  final String clock;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 112,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected
            ? ColorsTheme.accent.withOpacity(.45)
            : ColorsTheme.bgScreen,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: ColorsTheme.accent,
          width: 1,
        ),
      ),
      child: Center(
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 18,
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: ThemeText.headingTimeCategory,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  clock,
                  style: ThemeText.subheadingTimeCategory,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
