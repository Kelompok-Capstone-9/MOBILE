import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/explore/explore_screen.dart';
import 'package:gofit_apps/component/ticket_card.dart';

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
          const Divider(
            color: ColorsTheme.divider,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TicketCard(),
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
                      'Daily',
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
                      'Offline mentoring',
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
                      '1 March 2023',
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
                      '5AM - 12PM',
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
                      'Rp. 150.000',
                      style: ThemeText.heading3,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Location',
                  style: ThemeText.heading1,
                ),
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
    super.key,
    // Key? key,
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
