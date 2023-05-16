import 'package:carbon_flutter/carbon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CTag displays the correct label', (WidgetTester tester) async {
    const String label = 'Test Label';

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: CTag(label: label),
        ),
      ),
    );

    final textFinder = find.text(label);
    expect(textFinder, findsOneWidget);
  });
}
