import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/training/start_training/start_training.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainingPushUp extends StatefulWidget {
  final String data_training;

  final int index_page;

  final double widhtIsLoading;

  TrainingPushUp(
      {super.key,
      required this.data_training,
      required this.index_page,
      required this.widhtIsLoading});

  @override
  State<TrainingPushUp> createState() => _TrainingPushUp();
}

String _delay = '10';

class _TrainingPushUp extends State<TrainingPushUp> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: int.parse(_delay)),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => StartTrainingScren(
                data_training: widget.data_training,
                index_page: widget.index_page + 1,
                widgetIsLoading: widget.widhtIsLoading + 120,
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    var nextTrain = widget.index_page + 1;

    return Scaffold(
        // backgroundColor: ColorsTheme.primary600.withOpacity(0),
        body: Stack(children: [
      Container(
        // height: 420,
        // height: mediaquery.height * 0.60,
        height: mediaquery.height,
        width: mediaquery.width,
        color: ColorsTheme.primary600.withOpacity(0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120.0, bottom: 24),
              child: Center(
                child: Text(
                  'REST',
                  style: GoogleFonts.josefinSans(
                      fontSize: 55, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            Center(child: waktu(context, _delay)),
            const SizedBox(
              height: 59,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary:
                          ColorsTheme.activeButton, //background color of button
                      //border width and color
                      elevation: 5, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.only(
                          left: 150, right: 150) //content padding inside button
                      ),
                  onPressed: () {
                    double tambah = 120;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StartTrainingScren(
                              data_training: widget.data_training,
                              index_page: widget.index_page + 1,
                              widgetIsLoading: tambah +=
                                  mediaquery.width * 0.45)),
                    );
                  },
                  child: const Text("Skip")),
            ),
            const SizedBox(
              height: 59,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('NEXT',
                        style: ThemeText.headingTitle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: ColorsTheme.primary600)),
                    SizedBox(
                      width: 10,
                    ),
                    if (widget.index_page == 1)
                      Text('3/3',
                          style: ThemeText.headingTitle
                              .copyWith(fontWeight: FontWeight.w400))
                    else if (widget.index_page == 2)
                      Text('1/3',
                          style: ThemeText.headingTitle
                              .copyWith(fontWeight: FontWeight.w400))
                    else if (widget.index_page == 0)
                      Text('2/3',
                          style: ThemeText.headingTitle
                              .copyWith(fontWeight: FontWeight.w400))
                  ]),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(content[nextTrain]['type'].toString(),
                      style: ThemeText.headingTitle
                          .copyWith(fontWeight: FontWeight.w400)),
                  Text(content[nextTrain]['durationPlay'].toString(),
                      style: ThemeText.headingTitle
                          .copyWith(fontWeight: FontWeight.w400)),
                ],
              ),
            )
          ],
        ),
      ),
      Positioned(
          bottom: -0,
          // top: 450,
          child: SizedBox(
            width: mediaquery.width,
            height: mediaquery.height * 0.43,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(48), // Image radius
                child: Image.asset(content[nextTrain]['gifImage'].toString(),
                    fit: BoxFit.cover),
              ),
            ),
          )),
    ]));
  }

  CountdownTimer waktu(BuildContext context, waktu) {
    return CountdownTimer(
      endTime:
          DateTime.now().millisecondsSinceEpoch + (1 * int.parse(waktu) * 1000),
      onEnd: () {},
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) {
          return Text('00:00',
              style: ThemeText.headingLabelGofit
                  .copyWith(color: ColorsTheme.black, fontSize: 28));
        }
        int remainingTime =
            (time.min ?? 0).toInt() * 60 + (time.sec ?? 0).toInt();
        final minutes = ((remainingTime - 1) ~/ 60).toString().padLeft(2, '0');
        final seconds = ((remainingTime - 1) % 60).toString().padLeft(2, '0');
        final timeFormat = '$minutes:$seconds';
        return Text(timeFormat,
            style: ThemeText.headingLabelGofit
                .copyWith(color: ColorsTheme.black, fontSize: 28));
      },
    );
  }
}
