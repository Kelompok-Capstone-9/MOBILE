import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/view/article/artikel_screen.dart';

void main() {
  group('Artikel', () {
    testWidgets('Test Text', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Artikel(),
      ));

      Finder textArticles = find.byType(Text);
      expect(textArticles, findsNWidgets(4));
    });
  });
}
