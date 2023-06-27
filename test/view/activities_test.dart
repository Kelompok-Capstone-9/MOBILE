import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/view/activities/activities_screen.dart';
import 'package:gofit_apps/view_model/booking_provider.dart';
import 'package:provider/provider.dart';

void main() {
  group('Activities', () {
    testWidgets('Test text Activities', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => BookingProvider(),
          child: const MaterialApp(
            home: ActivitiesScreen(),
          ),
        ),
      );
      Finder textField = find.byType(Text);
      expect(textField, findsNWidgets(3));
    });

    testWidgets('Test Tab', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => BookingProvider(),
          child: const MaterialApp(
            home: ActivitiesScreen(),
          ),
        ),
      );
      final tabBar = find.byType(TabBar);
      expect(tabBar, findsOneWidget);
    });
  });
}
