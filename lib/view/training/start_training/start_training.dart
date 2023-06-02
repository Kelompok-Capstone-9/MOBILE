import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/training/training_done.dart';
import 'package:gofit_apps/view/training/training_rest.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class StartTrainingScren extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String data_training;

  var index_page;

  double widgetIsLoading;

  StartTrainingScren(
      {super.key,
      required this.data_training,
      required this.index_page,
      required this.widgetIsLoading});
// tangkep data construct

  @override
  State<StartTrainingScren> createState() => _StartTrainingScrenState();
}
// double _widthIsLoading = widget.widgetIsLoading;

class _StartTrainingScrenState extends State<StartTrainingScren> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    var a = widget.data_training;
    int _indexPage = widget.index_page;

    // var b = a[0]['da'].toString
    return Scaffold(
      // no appbar
      body: Column(
        // img
        children: [
          Text(widget.data_training),
          if (widget.data_training == 'content' && _indexPage == 0)
            SizedBox(
                width: mediaquery.width,
                height: 400,
                child: Image.asset(
                  content[0]['gifImage'].toString(),
                  fit: BoxFit.cover,
                ))
          else if (widget.data_training == 'content' && _indexPage == 1)
            SizedBox(
                width: mediaquery.width,
                height: 400,
                child: Image.asset(
                  content[1]['gifImage'].toString(),
                  fit: BoxFit.cover,
                ))
          else
            SizedBox(
                width: mediaquery.width,
                height: 400,
                child: Image.asset(
                  content[2]['gifImage'].toString(),
                  fit: BoxFit.cover,
                )),

          //container

          Stack(
            children: [
              Container(
                height: 8,
                width: mediaquery.width,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(1)),

                // child: ,
              ),
              Container(
                height: 8,
                width: widget.index_page == 2 ? 600 : widget.widgetIsLoading,
                decoration: BoxDecoration(
                    color: ColorsTheme.activeButton,
                    borderRadius: BorderRadius.circular(20)),

                // child: ,
              ),
            ],
          ),
          // text
          const SizedBox(height: 48),
          if (widget.data_training == 'content' && _indexPage == 0)
            Column(
              children: [
                Text(
                  content[0]['type'].toString(),
                  style: ThemeText.headingLabelGofit
                      .copyWith(color: ColorsTheme.black, fontSize: 28),
                ),
                const SizedBox(height: 24),
                waktu(context, content[0]['durationPlay'].toString()),
              ],
            )
          else if (widget.data_training == 'content' && _indexPage == 1)
            Column(
              children: [
                Text(content[1]['type'].toString(),
                    style: ThemeText.headingLabelGofit
                        .copyWith(color: ColorsTheme.black, fontSize: 28)),
                const SizedBox(height: 24),
                waktu(context, content[1]['durationPlay'].toString()),
              ],
            )
          else
            Column(
              children: [
                Text(content[2]['type'].toString(),
                    style: ThemeText.headingLabelGofit
                        .copyWith(color: ColorsTheme.black, fontSize: 28)),
                const SizedBox(height: 24),
                waktu(context, content[2]['durationPlay'].toString()),
              ],
            ),
        ],
      ),
      bottomNavigationBar: Container(
        color: ColorsTheme.colorButton.withOpacity(0.3),
        padding: const EdgeInsets.all(16),
        width: mediaquery.width,
        height: 80,
        child: GestureDetector(
          onTap: () {
            setState(() {});

            // if (status == 'idle') {
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    if (widget.index_page == 0) {
                    } else if (widget.index_page == 1) {
                      setState(() {
                        log(_indexPage.toString());

                        widget.widgetIsLoading = mediaquery.width - 240;
                        widget.index_page = 0;

                        print(widget.widgetIsLoading);
                      });
                    } else if (widget.index_page == 2) {
                      setState(() {
                        log(_indexPage.toString());

                        widget.widgetIsLoading = mediaquery.width - 120;
                        widget.index_page = 1;

                        print(widget.widgetIsLoading);
                      });
                    } else if (widget.index_page == 1) {
                      setState(() {
                        log(_indexPage.toString());

                        widget.widgetIsLoading = 120;
                        widget.index_page = 0;

                        print(widget.widgetIsLoading);
                      });
                    }
                  },
                  // child: _indexPage > 2 ? Text("Next") : Text("prev"))
                  child: _indexPage != 0
                      ? Row(
                          children: [
                            Icon(Icons.skip_previous, color: ColorsTheme.black),
                            Text(
                              "Previous",
                              style: ThemeText.headingpaymentSucces
                                  .copyWith(fontSize: 20),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Icon(Icons.skip_previous,
                                color: ColorsTheme.disableColorButton),
                            Text(
                              "Previous",
                              style: ThemeText.headingpaymentSucces.copyWith(
                                  fontSize: 20,
                                  color: ColorsTheme.disableColorButton),
                            ),
                          ],
                        )),
              Center(
                child: const Text(
                  '|',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      if (_indexPage == 2) {
                        log('tidak bisa, sudah finish');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrainingDoneScreen()));
                      } else {
                        log(_indexPage.toString());

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrainingPushUp(
                                      data_training: widget.data_training,
                                      index_page: _indexPage,
                                      widhtIsLoading: widget.widgetIsLoading,
                                    )));

                        // _widthIsLoading += mediaquery.width * 0.45;
                        // _indexPage += 1;
                      }
                    });
                  },
                  // child: _indexPage > 2 ? Text("Next") : Text("prev"))
                  child: _indexPage == 2
                      ? Row(
                          children: [
                            Icon(
                              Icons.skip_previous,
                            ),
                            Text(
                              "Finish",
                              style: ThemeText.headingpaymentSucces.copyWith(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: ColorsTheme.black,
                            ),
                            Text(
                              "Next",
                              style: ThemeText.headingpaymentSucces
                                  .copyWith(fontSize: 20),
                            ),
                          ],
                        )),
            ],
          ),
        ),
      ),
    );
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
