import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starter_kit/starter_kit.dart';
import 'package:starter_kit/src/presentation/pages/dashboard_screen_screen.dart';

void main() {
  group('DashboardScreenScreen Tests', () {
    testWidgets('should display screen title', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const DashboardScreenScreen(),
          navigatorKey: NavigationUtils.navigatorKey,
        ),
      );

      expect(find.text('DashboardScreen'), findsOneWidget);
      expect(find.text('Welcome to DashboardScreen'), findsOneWidget);
      expect(find.text('Get Started'), findsOneWidget);
    });

    testWidgets('should handle button press', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const DashboardScreenScreen(),
          navigatorKey: NavigationUtils.navigatorKey,
        ),
      );

      await tester.tap(find.text('Get Started'));
      await tester.pump();

      // Add your assertions here
    });
  });
}
