import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/view/login/login_screen.dart';

void main() {
  group('Login', () {
    testWidgets('Test text pada login', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: FormLogin(),
      ));
      Finder nameField = find.byType(Text);
      expect(nameField, findsNWidgets(8));
    });

    testWidgets('Test text form field', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: FormLogin(),
      ));

      Finder inputField = find.byType(TextFormField);
      expect(inputField, findsNWidgets(2));
    });
    
    testWidgets('Test button login', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: FormLogin(),
      ));

      Finder loginButton = find.byType(ElevatedButton);
      expect(loginButton, findsOneWidget);
    });

  });
}
