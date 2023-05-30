import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';

class SearchGymView extends StatelessWidget {
  const SearchGymView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopBar(),
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

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 18,
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Container(
                  height: 44,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      left: 2, right: 2, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: ColorsTheme.searchbox,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    style: ThemeText.headingSearchBlack,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 18,
                      ),
                      hintText: 'Search gym or virtual training',
                      hintStyle: ThemeText.headingSearchBig,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
