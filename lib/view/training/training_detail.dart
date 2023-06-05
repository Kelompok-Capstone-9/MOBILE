import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/view/training/start_training/start_training.dart';

import '../../component/booking_detail/button.dart';
import '../../model/list_detail_dummy.dart';
import '../../themes/color_style.dart';

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
      body: SizedBox(
        child: Column(
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
                  return InkWell(
                    onTap: () {
                      log('alert dialog');
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                backgroundColor: ColorsTheme.white,
                                insetPadding: const EdgeInsets.only(
                                    left: 30, right: 30, bottom: 200, top: 200),
                                content: SizedBox(
                                  width: MediaQuery.of(context).size.width - 10,
                                  height:
                                      MediaQuery.of(context).size.height - 80,
                                  child: Column(
                                    children: <Widget>[
                                      Stack(
                                        children: [
                                          SizedBox(
                                              width: mediaquery.width,
                                              child: Image.asset(
                                                content[index]['gifImage']
                                                    .toString(),
                                                fit: BoxFit.cover,
                                              )),
                                          GestureDetector(
                                            onTap: () =>
                                                Navigator.of(context).pop(),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.close,
                                                  size: 35,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 12.0),
                                          child: Text(
                                            content[index]['type'].toString(),
                                            style: ThemeText.headingg.copyWith(
                                              fontSize: 26,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            content[index]['desc'].toString(),
                                            style: ThemeText.headingInputForm,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          });
                    },
                    child: Card(
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
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: ColorsTheme.primary600.withOpacity(0.10),
        padding: const EdgeInsets.all(16),
        width: mediaquery.width,
        height: 80,
        child: GestureDetector(
            onTap: () {
              log('masuk k start training');
              // kirim construct
              // data type training,
              // this.rekomended training <== ceritanya
              // String data = 'introduction/beginner';
              String data = 'content';

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StartTrainingScren(
                    data_training: data,
                    index_page: 0,
                    widgetIsLoading: 120,
                  ),
                ),
              );
            },
            child: ButtonPay(textButton: 'Start')),
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
