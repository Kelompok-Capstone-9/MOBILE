import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/component/activities/activities_card.dart';
import 'package:gofit_apps/view/activities/activities_screen.dart';

void main() {
  group('Activities', () {
    testWidgets('Test text Activities', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ActivitiesScreen(),
        ),
      );
      Finder textField = find.byType(Text);
      expect(textField, findsNWidgets(11));
    });

    testWidgets('Test Card', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ActivitiesScreen(),
        ),
      );
      final activitiesCard = find.byType(ActivitiesCard);
      expect(activitiesCard, findsNWidgets(2));
    });

    testWidgets('Test Tab', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ActivitiesScreen(),
        ),
      );
      final tabBar = find.byType(TabBar);
      expect(tabBar, findsOneWidget);
    });
  });
}
