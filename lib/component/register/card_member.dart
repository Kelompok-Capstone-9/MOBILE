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
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              duration,
              style: ThemeText.heading1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: ThemeText.memberPaid,
                ),
                Text(
                  desc,
                  style: ThemeText.headingSub2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
