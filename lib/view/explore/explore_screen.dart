import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 18,
                ),
                const SizedBox(width: 24),
                Text(
                  'Explore Class',
                  style: ThemeText.heading1,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              height: 54,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: ColorsTheme.searchbox,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Your Location',
                    style: ThemeText.headingSearchSmall,
                  ),
                  const SizedBox(height: 9),
                  Text(
                    'Jl. Setia Budi No.210',
                    style: ThemeText.headingLocation,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 44,
              width: double.infinity,
              padding:
                  const EdgeInsets.only(left: 2, right: 2, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: ColorsTheme.searchbox,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                style: ThemeText.headingSearchBlack,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 18,
                  ),
                  hintText: 'Search gym or virtual training',
                  hintStyle: ThemeText.headingSearchBig,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
