// This is a basic Flutter widget test for the MediGo application.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:medi_go/main.dart';

void main() {
  testWidgets('Dashboard loads and displays key text elements', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the welcome greeting is displayed.
    expect(find.text('Welcome, John!'), findsOneWidget);

    // Verify that the "Nearby Partners" title is displayed.
    expect(find.text('Nearby Partners'), findsOneWidget);

    // Verify that hospital cards are rendered.
    expect(find.text('City Hospital'), findsOneWidget);
    expect(find.text('PathKind Lab'), findsOneWidget);
    expect(find.text('Apolo Hospital'), findsOneWidget);
  });
}
