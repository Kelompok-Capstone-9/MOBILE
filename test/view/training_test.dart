import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/component/training/levels_section.dart';
import 'package:gofit_apps/component/training/ontrending_card.dart';
import 'package:gofit_apps/component/training/ontrending_section.dart';
import 'package:gofit_apps/component/training/recommend_section.dart';
import 'package:gofit_apps/view/training/training_screen.dart';

void main() {
  group('Training', () {
    //training screen
    testWidgets('Test text Training', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TrainingScreen(),
        ),
      );
      Finder textField = find.byType(Text);
      expect(textField, findsNWidgets(21));
    });

    testWidgets('Test OnTrending', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TrainingScreen(),
        ),
      );
      final onTrendingSection = find.byType(OnTrendingSection);
      expect(onTrendingSection, findsOneWidget);
    });

    testWidgets('Test recommendSection', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TrainingScreen(),
        ),
      );
      final recommendSection = find.byType(RecommendSection);
      expect(recommendSection, findsOneWidget);
    });

    testWidgets('Test levelsSection', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TrainingScreen(),
        ),
      );
      final levelsSection = find.byType(LevelsSection);
      expect(levelsSection, findsOneWidget);
    });

    // onTranding screen
    testWidgets('OnTrending Section UI Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OnTrendingSection(),
          ),
        ),
      );

      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(OnTrendingCard), findsNWidgets(2));
    });
  });
}
