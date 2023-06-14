import 'package:flutter/material.dart';
import '../../themes/color_style.dart';

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(288, 40),
    backgroundColor: ColorsTheme.colorButton,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))));
