import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/component/login/forgot_password_screen.dart';

void main() {
  group('Forgot', () {
    testWidgets('Test text pada forgot', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: ForgotPassword(),
      ));
      Finder textField = find.byType(Text);
      expect(textField, findsNWidgets(4));
    });

    testWidgets('Test text form field', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: ForgotPassword(),
      ));

      Finder inputField = find.byType(TextFormField);
      expect(inputField, findsOneWidget);
    });
    
    testWidgets('Test button submit', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: ForgotPassword(),
      ));

      Finder loginButton = find.byType(ElevatedButton);
      expect(loginButton, findsOneWidget);
    });

  });
}
