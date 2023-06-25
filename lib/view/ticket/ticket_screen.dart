import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/explore/explore_screen.dart';
import 'package:gofit_apps/component/ticket_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../component/booking_detail/convert.dart';
import '../../view_model/booking_provider.dart';

class TicketScreen extends StatefulWidget {
  int classIdBooking;

  TicketScreen({super.key, required this.classIdBooking});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<BookingProvider>(context, listen: false).getClassTiketById(
          classPackageIdBooked: widget.classIdBooking,
        ));
  }

  final LatLng _center = const LatLng(106.81676627549479, -6.199986593324147);
  GoogleMapController? mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<BookingProvider>(context, listen: false);
    final detail = prov.classTiketById!.data.classPackage;

    return Scaffold(
      appBar: AppBar(
          elevation: 0.8,
          title: Text('Details ticket', style: ThemeText.heading1),
          leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExploreScreen(),
                  ),
                );
              },
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // const Padding(
          //   padding: EdgeInsets.only(top: 60),
          //   child: TopBar(),
          // ),
          // const Divider(
          //   color: ColorsTheme.divider,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TicketCard(context: context),
                const SizedBox(height: 20),
                Text(
                  'Booking Detail',
                  style: ThemeText.heading1,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.shopping_cart_outlined),
                          const SizedBox(width: 10),
                          Text(
                            'Booking Type',
                            style: ThemeText.heading3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      detail.period,
                      style: ThemeText.heading3,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.tv_outlined),
                          const SizedBox(width: 10),
                          Text(
                            'Class Type',
                            style: ThemeText.heading3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${detail.classPackageClass.classType} mentoring',
                      style: ThemeText.heading3,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.calendar_month_rounded),
                          const SizedBox(width: 10),
                          Text(
                            'Periode of Booking',
                            style: ThemeText.heading3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      formatDateOnly(
                          detail.classPackageClass.startedAt.toString()),
                      style: ThemeText.heading3,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.timer_outlined),
                          const SizedBox(width: 10),
                          Text(
                            'Time Session',
                            style: ThemeText.heading3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      formatTimeOnly(
                          detail.classPackageClass.startedAt.toString()),
                      style: ThemeText.heading3,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.receipt_long_outlined),
                          const SizedBox(width: 10),
                          Text(
                            'Booking Code',
                            style: ThemeText.heading3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'B17AF30CD',
                      style: ThemeText.heading3,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.attach_money_outlined),
                          const SizedBox(width: 10),
                          Text(
                            'Price',
                            style: ThemeText.heading3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      formatCurrency(detail.price),
                      style: ThemeText.heading3,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Location',
                  style: ThemeText.heading1,
                ),
                detail.classPackageClass.classType == "offline"
                    ? Text("ini clas ofline")
                    : Text("ini clas online")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class TopBar extends StatelessWidget {
//   const TopBar({
//     super.key,
//     // Key? key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 0,
//       child: Row(
//         children: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.arrow_back_rounded,
//               color: Colors.black,
//               size: 18,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ExploreScreen(),
//                 ),
//               );
//             },
//           ),
//           const SizedBox(width: 10),
//           Text(
//             'Details Ticket',
//             style: ThemeText.heading1,
//           ),
//         ],
//       ),
//     );
//   }
// }
