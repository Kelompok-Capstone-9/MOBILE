import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class SearchLocView extends StatelessWidget {
  const SearchLocView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.8,
          title: Container(
            width: double.infinity,
            height: 40,
            padding:
                const EdgeInsets.only(left: 2, right: 2, top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: ColorsTheme.searchbox,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: TextField(
                style: ThemeText.headingLocation,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    floatingLabelStyle: ThemeText.headingSearchBlack,
                    border: InputBorder.none,
                    hintStyle: ThemeText.headingSearchBig,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 18,
                    ),
                    hintText: 'Search location'),
              ),
            ),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: ColorsTheme.bgScreen),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search result',
                  style: ThemeText.heading2.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
