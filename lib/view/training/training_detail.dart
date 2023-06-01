import 'package:flutter/material.dart';

import '../../model/list_detail_dummy.dart';
import '../../themes/color_style.dart';
import '../booking_detail/widget/button.dart';

class TrainingDetail extends StatefulWidget {
  const TrainingDetail({super.key});

  @override
  State<TrainingDetail> createState() => _TrainingDetailState();
}

class _TrainingDetailState extends State<TrainingDetail> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text('Fat Burning Fitness', style: ThemeText.heading1),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      backgroundColor: ColorsTheme.bgScreen,
      body: Column(
        children: [
          SizedBox(
              width: mediaquery.width,
              child: Image.asset(
                'assets/images/05.jpg',
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16, bottom: 16),
            child: SizedBox(
              width: mediaquery.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                    child: Text(
                      'Introduction',
                      style: ThemeText.headingg,
                    ),
                  ),
                  Text(
                    'Belly fat burning fitness alternates intense exercises with less intense recovery periods.You can melt away excess fat fast and your body even keeps burning calories in the next 24 hours of your exercises.',
                    style: ThemeText.headingDesc,
                  ),
                  Divider(),
                  listLevel(mediaquery),
                  Divider(),
                ],
              ),
            ),
          ),
          Expanded(
            // height: 400,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              // physics: neverS,
              itemCount: content.length,
              itemBuilder: (context, index) {
                return Card(
                  // kemana ilangnya code yaampun :(
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 120,
                          child: Image.asset(
                              content[index]['gifImage'].toString())),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              content[index]['type'].toString(),
                              style: ThemeText.headingg,
                            ),
                            Text(
                              content[index]['durationPlay'].toString(),
                              style: ThemeText.headingg
                                  .copyWith(color: Color(0xff919191)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: ColorsTheme.primary600.withOpacity(0.10),
        padding: const EdgeInsets.all(16),
        width: mediaquery.width,
        height: 80,
        child: GestureDetector(
            onTap: () {}, child: ButtonPay(textButton: 'Start')),
      ),
    );
  }

  Padding listLevel(Size mediaquery) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
          height: 40,
          width: mediaquery.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 6,
                    color: Color(0xff787579),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Beginner",
                      style: ThemeText.headingListDivider,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 6,
                    color: Color(0xff787579),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "1 Minute",
                      style: ThemeText.headingListDivider,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 6,
                    color: Color(0xff787579),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "3 Workouts",
                      style: ThemeText.headingListDivider,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
