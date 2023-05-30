import 'package:flutter/material.dart';
import 'package:gofit_apps/themes/color_style.dart';
import 'package:gofit_apps/view/filter/widgets/filter_class.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.bgScreen,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price range',
                      style: ThemeText.heading2,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Minimum price',
                              labelStyle: ThemeText.heading3.copyWith(
                                fontWeight: FontWeight.w400,
                                color: ColorsTheme.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 47),
                        const Text('-'),
                        const SizedBox(width: 47),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Maximum price',
                              labelStyle: ThemeText.heading3.copyWith(
                                fontWeight: FontWeight.w400,
                                color: ColorsTheme.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(color: ColorsTheme.divider),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Type class',
                      style: ThemeText.heading2,
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        ClassFilter(classtype: 'All'),
                        SizedBox(width: 10),
                        ClassFilter(classtype: 'Online'),
                        SizedBox(width: 10),
                        ClassFilter(classtype: 'Onsite'),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location Range',
                      style: ThemeText.heading2,
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        ClassFilter(classtype: 'All'),
                        SizedBox(width: 10),
                        ClassFilter(classtype: 'Under 2 km'),
                        SizedBox(width: 10),
                        ClassFilter(classtype: 'Above 2 km'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Divider(color: ColorsTheme.divider),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: ColorsTheme.grey,
                      width: 1,
                    ),
                  ),
                  child: const Icon(Icons.delete_outline),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 272,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorsTheme.accent,
                  ),
                  child: Text(
                    "Apply Settings",
                    style: ThemeText.heading1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8)
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
      height: 45,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 18,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 10),
          Text(
            'Filter',
            style: ThemeText.heading1,
          ),
        ],
      ),
    );
  }
}
