// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

// ignore: must_be_immutable
class CardMember extends StatelessWidget {
  String duration;
  String price;
  String desc;

  CardMember({
    Key? key,
    required this.duration,
    required this.price,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80,
      child: ListTile(
        trailing: Text(
          duration,
          style: ThemeText.heading3,
        ),
        title: Text(
          price,
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
