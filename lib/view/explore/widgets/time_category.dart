import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class TimeCategory extends StatefulWidget {
  const TimeCategory({
    super.key,
    required this.icon,
    required this.time,
    required this.clock,
  });

  final String icon;
  final String time;
  final String clock;

  @override
  _TimeCategoryState createState() => _TimeCategoryState();
}

class _TimeCategoryState extends State<TimeCategory> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
      },
      child: Container(
        height: 46,
        // width: 112,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: _isTapped
              ? ColorsTheme.accent.withOpacity(.45)
              : ColorsTheme.bgScreen,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 12,
              offset: const Offset(0, 4),
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
                widget.icon,
                height: 18,
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.time,
                    style: ThemeText.headingTimeCategory,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.clock,
                    style: ThemeText.subheadingTimeCategory,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
