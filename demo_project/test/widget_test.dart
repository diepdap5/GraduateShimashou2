// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_project/main.dart';
import 'package:demo_project/widget_management/tapboxA.dart';
import 'package:demo_project/widget_management/tapboxB.dart';
import 'package:demo_project/widget_management/tapboxC.dart';
// import 'package:demo_project/animation/animated_widget.dart';
// import 'package:demo_project/animation/animated_builder.dart';
import 'package:demo_project/animation/animated_simutaneous.dart';
import 'package:demo_project/internationalization/basic_example.dart';
import 'package:demo_project/image_adjust/fading.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp_Cached_Image());

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
}
