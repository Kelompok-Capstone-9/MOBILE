import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/explore/explore_screen.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 60),
            child: TopBar(),
          ),
          Divider(
            color: ColorsTheme.divider,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                    minVerticalPadding: 10,
                    leading: Image.asset(
                      "assets/images/open-gym.png",
                    ),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Open Gym',
                              style: ThemeText.heading2,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Onsite Class',
                              style: ThemeText.heading4.copyWith(
                                color: ColorsTheme.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Depok, Jawa Barat",
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
                                'Booked',
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
                ),
                const SizedBox(height: 20),
                Text(
                  'Booking Detail',
                  style: ThemeText.heading1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 18,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExploreScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
          Text(
            'Details Ticket',
            style: ThemeText.heading1,
          ),
        ],
      ),
    );
  }
}
