import 'package:flutter/material.dart';
import 'package:gofit_apps/component/navbar/home.dart';
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

    print('is id view : ${widget.classIdBooking}');
  }

  final LatLng _center = const LatLng(106.81676627549479, -6.199986593324147);
  GoogleMapController? mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          elevation: 0.8,
          title: Text('Details ticket', style: ThemeText.heading1),
          leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      body: Consumer<BookingProvider>(
        builder: (context, prov, child) {
          final detail = prov.tiket?.data?.classPackage;
          if (prov.requestState == RequestState.loading) {
            return SizedBox(
                height: mediaquery.height,
                child: Center(child: CircularProgressIndicator()));
          }
          if (prov.requestState == RequestState.loaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // const Padding(
                //   padding: EdgeInsets.only(top: 60),
                //   child: TopBar(),
                // ),
                // const Divider(
                //   color: ColorsTheme.divider,
                // ),SS
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                            '${detail!.period}',
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
                            '${detail.classInfo?.classType} mentoring',
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
                                detail.classInfo!.startedAt.toString()),
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
                                detail.classInfo!.startedAt.toString()),
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
                                  detail.classInfo!.classType == "online"
                                      ? "Link Code"
                                      : 'Booking Code',
                                  style: ThemeText.heading3,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            detail.classInfo!.classType == "online"
                                ? "oxf-wow-wsa"
                                : 'B17AF30CD',
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
                            formatCurrency(int.parse(detail.price.toString())),
                            style: ThemeText.heading3,
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        detail.classInfo?.classType == "offline"
                            ? 'Location'
                            : "",
                        style: ThemeText.heading1,
                      ),
                      detail.classInfo?.classType == "offline"
                          ? SizedBox(
                              width: mediaquery.width,
                              height: 200,
                              child: Center(child: CircularProgressIndicator()))
                          : Text("")
                      //     ? Text("ini clas ofline")
                      //     : Text("ini clas online")
                    ],
                  ),
                ),
              ],
            );
          }
          return SizedBox(
              height: mediaquery.height, child: Text("Error cant get Data"));
        },
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
