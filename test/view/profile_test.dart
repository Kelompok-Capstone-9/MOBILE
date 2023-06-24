import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/view/profile/personal_details_screen.dart';
import 'package:gofit_apps/view/profile/profile_screen.dart';
import 'package:gofit_apps/view_model/login_provider.dart';
import 'package:provider/provider.dart';

void main() {
  group('Profile', () {
    testWidgets('Test text pada Profile', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: const MaterialApp(
            home: ProfileScreen(),
          ),
        ),
      );
      Finder nameField = find.byType(Text);
      expect(nameField, findsNWidgets(12));
    });

    testWidgets('Test icon button profil', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: const MaterialApp(
            home: ProfileScreen(),
          ),
        ),
      );
      Finder icon = find.byType(IconButton);
      expect(icon, findsNWidgets(2));
    });

    testWidgets('Test button logout', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: const MaterialApp(
            home: ProfileScreen(),
          ),
        ),
      );

      Finder logoutButton = find.byType(ElevatedButton);
      expect(logoutButton, findsOneWidget);
    });

    testWidgets('Test circle avatar', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: const MaterialApp(
            home: ProfileScreen(),
          ),
        ),
      );

      Finder circle = find.byType(CircleAvatar);
      expect(circle, findsOneWidget);
    });

    testWidgets('Test image', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: const MaterialApp(
            home: ProfileScreen(),
          ),
        ),
      );

      Finder image = find.byType(Image);
      expect(image, findsOneWidget);
    });

    testWidgets('Test button news', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: const MaterialApp(
            home: ProfileScreen(),
          ),
        ),
      );

      Finder newsButton = find.byType(Switch);
      expect(newsButton, findsOneWidget);
    });

    testWidgets('Test text personal', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: const MaterialApp(
            home: PersonalDetailsScreen(),
          ),
        ),
      );

      Finder textField = find.byType(Text);
      expect(textField, findsNWidgets(17));
    });

    testWidgets('Test icon button personal', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: const MaterialApp(
            home: PersonalDetailsScreen(),
          ),
        ),
      );
      Finder icon = find.byType(IconButton);
      expect(icon, findsNWidgets(7));
    });
  });
}
