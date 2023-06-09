import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/component/training/levels_section.dart';
import 'package:gofit_apps/component/training/ontrending_section.dart';
import 'package:gofit_apps/component/training/recommend_section.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F6F6),
        elevation: 0.0,
        title: Text(
          'Training',
          style: ThemeText.heading1,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, right: 16, bottom: 8, left: 16),
              child: Text(
                'On Trending',
                style: ThemeText.headingg,
              ),
            ),
            const SizedBox(height: 8),
            const OnTrendingSection().animate().fadeIn().shimmer(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24, right: 16, bottom: 8, left: 16),
              child: Text(
                'Recommended',
                style: ThemeText.headingg,
              ),
            ),
            RecommendSection()
                .animate()
                .fadeIn()
                .shimmer(duration: Duration(seconds: 2)),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24, right: 16, bottom: 8, left: 16),
              child: Text(
                'Choose Your Levels',
                style: ThemeText.headingg,
              ),
            ),
            const LevelsSection()
          ],
        ),
      ),
    );
  }
}
