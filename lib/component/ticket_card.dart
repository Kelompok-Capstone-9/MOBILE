import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:provider/provider.dart';

import '../view_model/booking_provider.dart';

class TicketCard extends StatefulWidget {
  var context;

  TicketCard({super.key, required this.context});

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<BookingProvider>(context, listen: false);

    final detail = prov.classTiketById!.data.classPackage;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorsTheme.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: Image.network(
          'http://18.141.56.154:8000/${detail.classPackageClass.imageBanner}',
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset('assets/images/open-gym.png');
          },
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  detail.classPackageClass.location.name,
                  style: ThemeText.heading2,
                ),
                const SizedBox(height: 8),
                Text(
                  '${detail.classPackageClass.classType} class',
                  style: ThemeText.heading4.copyWith(
                    color: ColorsTheme.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  detail.classPackageClass.location.address,
                  style: ThemeText.heading4.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsTheme.success,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    prov.classTiketById!.data.status == "booked"
                        ? 'Booked'
                        : "Pending",
                    style: ThemeText.heading4.copyWith(
                      color: ColorsTheme.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
