import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class LocationFilter extends StatefulWidget {
  const LocationFilter({
    super.key,
    required this.location,
  });

  final String location;

  @override
  State<LocationFilter> createState() => _LocationFilterState();
}

class _LocationFilterState extends State<LocationFilter> {
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
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: _isTapped ? ColorsTheme.accent : ColorsTheme.bgScreen,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorsTheme.accent,
            width: 1,
          ),
        ),
        child: Text(
          widget.location,
          style: ThemeText.heading4.copyWith(
            fontWeight: FontWeight.w700,
            color: _isTapped ? ColorsTheme.black : ColorsTheme.accent,
          ),
        ),
      ),
    );
  }
}
