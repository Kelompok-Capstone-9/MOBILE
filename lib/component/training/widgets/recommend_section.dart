import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/model/recommend.dart';

import '../recommend_card.dart';

class RecommendSection extends StatelessWidget {
  RecommendSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 170,
        child: ListView.builder(
          itemCount: onRecommend.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var recommend = onRecommend[index];
            return GestureDetector(
              child: RecommendCard(
                  title: recommend.title,
                  time: recommend.time,
                  level: recommend.level,
                  image: recommend.image),
            );
          },
        ),
      ),
    );
  }
}
