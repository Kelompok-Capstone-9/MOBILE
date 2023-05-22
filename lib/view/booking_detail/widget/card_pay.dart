import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

// ignore: must_be_immutable
class CardPay extends StatelessWidget {
  String type;
  String image;
  String desc;

  CardPay(
      {super.key, required this.type, required this.desc, required this.image});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        type,
        style: ThemeText.heading3,
      ),
      subtitle: Text(
        desc,
        style: ThemeText.headingPaymentDescription,
      ),
      trailing: SizedBox(
        width: 50,
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
