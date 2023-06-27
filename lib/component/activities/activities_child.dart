import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gofit_apps/component/booking_detail/convert.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view_model/booking_provider.dart';
import 'package:provider/provider.dart';

import '../../model/detail_tiket_models.dart';

// ignore: must_be_immutable
class ActivityChild extends StatefulWidget {
  var status;

  ActivityChild({super.key, required this.status});

  @override
  State<ActivityChild> createState() => _ActivityChildState();
}

class _ActivityChildState extends State<ActivityChild> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<BookingProvider>(context, listen: false).getAllBooking());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (context, bookProv, child) {
        final List<DataDetailBooking> pendingBookings = [];
        // final dataLength = bookProv.allBooking;
        print(widget.status);
        bookProv.allBooking.forEach((booking) {
          if (booking.status == widget.status) {
            pendingBookings.add(booking);
          }
        });
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: pendingBookings.length,
            itemBuilder: (context, index) {
              final data = pendingBookings[index];

              return Container(
                decoration: const BoxDecoration(
                  color: ColorsTheme.bgActivites,
                ),
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.classPackage!.classInfo!.name.toString(),
                      style: ThemeText.heading1,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${data.classPackage!.classInfo!.location!.name.toString()} - ${data.classPackage!.classInfo!.location!.address.toString()}',
                      style: ThemeText.heading4,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 16,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${formatDateOnly(data.classPackage!.classInfo!.startedAt.toString())} ${formatTimeOnly(data.classPackage!.classInfo!.startedAt.toString())}',
                          style: ThemeText.heading4,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          data.classPackage!.classInfo!.classType == "online"
                              ? 'Online via Zoom'
                              : 'Offline',
                          style: ThemeText.heading4,
                        ),
                      ],
                    )
                  ],
                ),
              ).animate().fadeIn().shimmer(duration: Duration(seconds: 2));
            },
          ),
        );
      },
    );
  }
}
