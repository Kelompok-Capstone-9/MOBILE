import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

import '../themes/color_style.dart';

class TimeWidget extends StatefulWidget {
  var waktu;

  TextStyle styleText;

  var typeWaktu;

  TimeWidget(
      {super.key,
      required this.waktu,
      required this.typeWaktu,
      required this.styleText});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: DateTime.now().millisecondsSinceEpoch +
          (1 * int.parse(widget.waktu) * 1000),
      onEnd: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Time Out',
              style: ThemeText.heading2,
            ),
            backgroundColor: ColorsTheme.activeButton,
          ),
        );
      },
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) {
          return const Text('00:00');
        }
        // final Colors color = widget.colorText;
        final int remainingTimeInSeconds = ((time.hours ?? 0) * 3600) +
            ((time.min ?? 0) * 60) +
            (time.sec ?? 0);
        int remainingTime =
            (time.min ?? 0).toInt() * 60 + (time.sec ?? 0).toInt();
        final hours = (remainingTimeInSeconds ~/ 3600).toString();
        final minutes = ((remainingTime - 1) ~/ 60).toString().padLeft(2, '0');
        final seconds = ((remainingTime - 1) % 60).toString().padLeft(2, '0');

        if (widget.typeWaktu == 2) {
          final timeFormat = '$minutes:$seconds';
          return Text(
            timeFormat,
            style: widget.styleText,
          );
        } else if (widget.typeWaktu == 3) {
          final timeFormat = '$hours:$minutes:$seconds';
          return Text(
            timeFormat,
            style: widget.styleText,
          );
        } else {
          final timeFormat = '$seconds';
          return Text(
            timeFormat,
            style: widget.styleText,
          );
        }
      },
    );
  }
}
