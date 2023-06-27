import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class OnTrendingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const OnTrendingCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: Padding(
        padding: EdgeInsets.all(26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: ThemeText.headingOnTrendingCard,
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: ThemeText.subheadingOnTrendingCard,
            ),
          ],
        ),
      ),
    );
  }
}
