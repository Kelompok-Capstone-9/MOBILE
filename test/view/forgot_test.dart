import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/component/login/forgot_password_screen.dart';
import 'package:gofit_apps/component/login/reset_password_screen.dart';

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

      Finder submitButton = find.byType(ElevatedButton);
      expect(submitButton, findsOneWidget);
    });

    testWidgets('Test image', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ForgotPassword(),
        ),
      );

      Finder image = find.byType(Image);
      expect(image, findsOneWidget);
    });

    testWidgets('Test text reset', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: ResetPassword(),
      ));
      Finder textField = find.byType(Text);
      expect(textField, findsNWidgets(4));
    });

    testWidgets('Test form field reset', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: ResetPassword(),
      ));

      Finder inputField = find.byType(TextFormField);
      expect(inputField, findsNWidgets(2));
    });

    testWidgets('Test submit reset', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: ResetPassword(),
      ));

      Finder submitButton = find.byType(ElevatedButton);
      expect(submitButton, findsOneWidget);
    });

    testWidgets('Test image reset', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ResetPassword(),
        ),
      );

      Finder image = find.byType(Image);
      expect(image, findsOneWidget);
    });
  });
}
