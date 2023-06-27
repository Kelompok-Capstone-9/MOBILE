import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/view/article/artikel_screen.dart';
import 'package:gofit_apps/view_model/artikel_provider.dart';
import 'package:provider/provider.dart';

void main() {
  group('Artikel', () {
    testWidgets('Test Artikel', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ArtikelProvider(),
          child: const MaterialApp(
            home: Artikel(),
          ),
        ),
      );

      expect(find.text('ARTICLES'), findsOneWidget);
    });
    testWidgets('Test icon in artikel', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ArtikelProvider(),
          child: const MaterialApp(
            home: Artikel(),
          ),
        ),
      );
      Finder icon = find.byType(Icon);
      expect(icon, findsNWidgets(2));
    });

    testWidgets('Test form search', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ArtikelProvider(),
          child: const MaterialApp(
            home: Artikel(),
          ),
        ),
      );
      Finder form = find.byType(TextFormField);
      expect(form, findsOneWidget);
    });

    testWidgets('Test gridview', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ArtikelProvider(),
          child: const MaterialApp(
            home: Artikel(),
          ),
        ),
      );

      Finder gridView = find.byType(GridView);
      expect(gridView, findsOneWidget);
    });
  });
}
