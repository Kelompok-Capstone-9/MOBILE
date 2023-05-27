import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

// ignore: must_be_immutable
class CardTraining extends StatelessWidget {
  String name;
  String desc;

  CardTraining({super.key, required this.name, required this.desc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80,
      child: ListTile(
        title: Text(
          name,
          style: ThemeText.heading3,
        ),
        subtitle: Text(
          desc,
          style: ThemeText.headingPaymentDescription,
        ),
      ),
    );
  }
}
