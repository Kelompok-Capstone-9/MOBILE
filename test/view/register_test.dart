import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/view/register/register_screen.dart';

void main() {
  group('Register', () {
    testWidgets('Text Register', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RegisterScreen(),
      ));

      Finder nameField = find.byType(Text);
      expect(nameField, findsNWidgets(9));
    });

    testWidgets('Text Form Field Register', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RegisterScreen(),
      ));
      Finder nameField = find.byType(TextFormField);
      expect(nameField, findsNWidgets(4));
    });

    testWidgets('Test button register', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RegisterScreen(),
      ));

      Finder registerButton = find.byType(ElevatedButton);
      expect(registerButton, findsOneWidget);
    });
  });
}
