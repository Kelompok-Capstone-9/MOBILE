import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/training/widgets/levels_section.dart';
import 'package:gofit_apps/view/training/widgets/recommend_card.dart';
import 'package:gofit_apps/view/training/widgets/training_card.dart';

import '../../model/levels.dart';
import '../../model/recommend.dart';

class TrainingKategori extends StatefulWidget {
  const TrainingKategori({super.key});

  @override
  State<TrainingKategori> createState() => _TrainingKategoriState();
}

class _TrainingKategoriState extends State<TrainingKategori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.9,
          title: Text('Best Home Workout', style: ThemeText.heading1),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      backgroundColor: ColorsTheme.bgScreen,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 12),
            itemCount: onRecommend.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var recommend = onRecommend[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 128,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(recommend.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(26),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(recommend.title,
                            style: ThemeText.headingOnTrendingCard),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(recommend.time,
                                style: ThemeText.subheadingOnTrendingCard),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Icon(Icons.circle,
                                  size: 6, color: ColorsTheme.bgScreen),
                            ),
                            Text(recommend.level,
                                style: ThemeText.subheadingOnTrendingCard),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
