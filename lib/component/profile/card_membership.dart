import 'package:flutter/material.dart';
import '../../themes/color_style.dart';

class CardItem extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String trailing;

  const CardItem({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: ThemeText.headingCustomTittle,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      subtitle,
                      style: ThemeText.headingCustomRp,
                    ),
                    Text(
                      trailing,
                      style: ThemeText.headingTextPlan,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Unlimited Health Tips Content \n Unlimited Video Content Library \n Cancel Anytime',
              style: ThemeText.headingCustomTittle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    backgroundColor: ColorsTheme.colorButton),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'GET MEMBERSHIP',
                    style: ThemeText.headingCustomTittle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Terms and conditions',
                  style: ThemeText.headingCustomTerms,
                ),
                const SizedBox(width: 5),
                Text(
                  'apply.',
                  style: ThemeText.headingCustomApply,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
