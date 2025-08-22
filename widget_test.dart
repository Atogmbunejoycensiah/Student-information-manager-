import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:student_info_manager/main.dart';
import 'package:student_management_project/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const StudentInfoApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Welcome dashboard displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const StudentInfoApp());

    // Verify that welcome text is displayed
    expect(find.text('Welcome to Student Manager'), findsOneWidget);

    // Verify that name is displayed
    expect(find.text('Joyce Nsiah'), findsOneWidget);

    // Verify that course is displayed
    expect(find.text('Computer Science'), findsOneWidget);

    // Verify that university is displayed
    expect(find.text('University of Technology'), findsOneWidget);
  });

  testWidgets('Show Alert button displays snackbar', (WidgetTester tester) async {
    await tester.pumpWidget(const StudentInfoApp());

    // Tap the 'Show Alert' button
    await tester.tap(find.text('Show Alert'));
    await tester.pump();

    // Verify that snackbar is displayed
    expect(find.text('Hello, Joyce Nsiah! Welcome to the Student Info Manager.'), findsOneWidget);
  });

  testWidgets('Login form validation works', (WidgetTester tester) async {
    await tester.pumpWidget(const StudentInfoApp());

    // Try to login with empty fields
    await tester.tap(find.text('Login'));
    await tester.pump();

    // Verify that error messages are displayed
    expect(find.text('Please enter your email'), findsOneWidget);
  });
}