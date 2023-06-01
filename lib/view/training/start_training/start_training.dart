import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofit_apps/model/list_detail_dummy.dart';
import 'package:gofit_apps/themes/color_style.dart';

class StartTrainingScren extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String data_training;

  StartTrainingScren({super.key, required this.data_training});
// tangkep data construct

  @override
  State<StartTrainingScren> createState() => _StartTrainingScrenState();
}

int _indexPage = 0;
double _widthIsLoading = 120;

class _StartTrainingScrenState extends State<StartTrainingScren> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    var a = widget.data_training;
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
                width: _widthIsLoading,
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
                SizedBox(height: 24),
                Text(
                  content[0]['durationPlay'].toString(),
                  style: ThemeText.headingLabelGofit
                      .copyWith(color: ColorsTheme.black),
                ),
              ],
            )
          else if (widget.data_training == 'content' && _indexPage == 1)
            Column(
              children: [
                Text(content[1]['type'].toString(),
                    style: ThemeText.headingLabelGofit
                        .copyWith(color: ColorsTheme.black, fontSize: 28)),
                SizedBox(height: 24),
                Text(
                  content[0]['durationPlay'].toString(),
                  style: ThemeText.headingLabelGofit
                      .copyWith(color: ColorsTheme.black),
                ),
              ],
            )
          else
            Column(
              children: [
                Text(content[2]['type'].toString(),
                    style: ThemeText.headingLabelGofit
                        .copyWith(color: ColorsTheme.black, fontSize: 28)),
                SizedBox(height: 24),
                Text(
                  content[0]['durationPlay'].toString(),
                  style: ThemeText.headingLabelGofit
                      .copyWith(color: ColorsTheme.black),
                ),
              ],
            )
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
                    if (_indexPage == 0) {
                    } else {
                      setState(() {
                        log(_indexPage.toString());

                        _widthIsLoading += mediaquery.width * -0.45;
                        _indexPage -= 1;

                        print(_widthIsLoading);
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
                        log('tidak bisa');
                      } else {
                        log(_indexPage.toString());

                        _widthIsLoading += mediaquery.width * 0.45;
                        _indexPage += 1;

                        print(_widthIsLoading);
                      }
                    });
                  },
                  // child: _indexPage > 2 ? Text("Next") : Text("prev"))
                  child: _indexPage == 2
                      ? Row(
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
}

//  

