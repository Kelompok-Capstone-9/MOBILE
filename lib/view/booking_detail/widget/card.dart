import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class CardWidget extends StatelessWidget {
  IconData icon;

  var keterangan;

  CardWidget({super.key, required this.icon, required this.keterangan});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: ColorsTheme.bgScreen,
        shadowColor: Colors.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: Color(0xff919191),
          ),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(top: 21.0, bottom: 21, left: 18),
          child: SizedBox(
            child: Row(children: [
              Icon(
                icon as IconData?,
                color: Color(0xff00007A),
                size: 30,
              ),
              const SizedBox(width: 12),
              Text(
                keterangan,
                style: ThemeText.heading2,
              )
            ]),
          ),
        ));
  }
}
