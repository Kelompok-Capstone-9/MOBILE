import 'package:flutter/material.dart';
import 'package:gofit_apps/model/trending.dart';
import 'package:gofit_apps/view/training/widgets/ontrending_card.dart';

class OnTrendingSection extends StatefulWidget {
  const OnTrendingSection({Key? key}) : super(key: key);

  @override
  State<OnTrendingSection> createState() => _OnTrendingSectionState();
}

class _OnTrendingSectionState extends State<OnTrendingSection> {
  final PageController _pageController = PageController(viewportFraction: 0.96);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.maxFinite,
      child: PageView.builder(
        itemCount: onTrending.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {});
        },
        itemBuilder: (context, index) {
          var trending = onTrending[index];
          return GestureDetector(
            child: OnTrendingCard(
              title: trending.title,
              subtitle: trending.subtitle,
              image: trending.image,
            ),
          );
        },
      ),
    );
  }
}
