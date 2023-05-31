import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';

// ignore: must_be_immutable
class CardTraining extends StatelessWidget {
  String image;
  String title;

  CardTraining({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 80,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: ThemeText.heading3,
            ),
          ),
        )
      ],
    );
  }
}
