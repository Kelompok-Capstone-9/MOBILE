import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class RecommendCard extends StatelessWidget {
  final String title;
  final String time;
  final String level;
  final String image;

  const RecommendCard({
    super.key,
    required this.title,
    required this.time,
    required this.level,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: ThemeText.headingOnTrendingCard,
          ),
          SizedBox(height: 8),
          Text(
            "$time - $level",
            style: ThemeText.subheadingOnTrendingCard,
          ),
        ],
      ),
    );
  }
}
