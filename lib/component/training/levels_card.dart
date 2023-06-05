import 'package:flutter/material.dart';

class LevelsCard extends StatelessWidget {
  const LevelsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      children: List.generate(
        3,
        (index) {
          return GestureDetector(
            onTap: () {},
            child: Card(
              child: Column(
                children: [
                  Text('Title $index'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
