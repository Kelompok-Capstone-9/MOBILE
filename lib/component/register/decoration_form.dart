import 'package:flutter/material.dart';
import '../../themes/color_style.dart';

class DecorationFormStyle {
  static decorationForm({
    required String labelText,
    required Widget prefixIcon,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: Color(0xffD9D9D9),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFF7F00)),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFF595C)),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        labelText: labelText,
        labelStyle: ThemeText.headingInput,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      );
}
