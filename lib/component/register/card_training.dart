import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

// ignore: must_be_immutable
class CardTraining extends StatelessWidget {
  String? nameLevel;
  String? desc;
  final bool isTapped;

  CardTraining({
    super.key,
    this.nameLevel,
    this.desc,
    this.isTapped = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80,
      child: ListTile(
        title: Text(nameLevel!,
            style: isTapped ? ThemeText.memberPaid : ThemeText.heading1),
        subtitle: Text(
          desc!,
          style: ThemeText.headingPaymentDescription,
        ),
      ),
    );
  }
}
