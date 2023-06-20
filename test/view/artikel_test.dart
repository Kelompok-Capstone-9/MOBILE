import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/view/article/artikel_screen.dart';

void main() {
  group('Artikel', () {
    testWidgets('Test Text form field', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Artikel(),
      ));

      Finder searchField = find.byType(TextFormField);
      expect(searchField, findsOneWidget);
    });
  });
}
