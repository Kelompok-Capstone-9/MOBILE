import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:provider/provider.dart';

import '../../view_model/booking_provider.dart';

class ClassFilter extends StatefulWidget {
  const ClassFilter({
    super.key,
    required this.classtype,
  });

  final String classtype;

  @override
  State<ClassFilter> createState() => _ClassFilterState();
}

class _ClassFilterState extends State<ClassFilter> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
          // print(widget.classtype);
          Provider.of<BookingProvider>(context, listen: false)
              .searchChip(widget.classtype.toString());
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
          widget.classtype,
          style: ThemeText.heading4.copyWith(
            fontWeight: FontWeight.w700,
            color: _isTapped ? ColorsTheme.black : ColorsTheme.accent,
          ),
        ),
      ),
    );
  }
}
