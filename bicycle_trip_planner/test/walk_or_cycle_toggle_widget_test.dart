import 'dart:io';

import 'package:bicycle_trip_planner/managers/DirectionManager.dart';
import 'package:bicycle_trip_planner/widgets/navigation/WalkOrCycleToggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'setUp.dart';

void main() {
  setUpAll(() async {
    HttpOverrides.global = null;
  });

  testWidgets('WalkOrCycleToggle has a button', (WidgetTester tester) async {
    await pumpWidget(tester, WalkOrCycleToggle());

    final button = find.byType(ElevatedButton);

    expect(button, findsOneWidget);
  });

  testWidgets('WalkOrCycleToggle has a walk icon', (WidgetTester tester) async {
    await pumpWidget(tester, WalkOrCycleToggle());

    final walkIcon = find.byIcon(Icons.directions_walk);

    expect(walkIcon, findsOneWidget);
  });

  testWidgets('WalkOrCycleToggle has a bike icon', (WidgetTester tester) async {
    await pumpWidget(tester, WalkOrCycleToggle());

    final bikeIcon = find.byIcon(Icons.directions_bike);

    expect(bikeIcon, findsOneWidget);
  });

  testWidgets('When isCycling is false walkIcon is red', (WidgetTester tester) async {
    DirectionManager directionManager = DirectionManager();
    if(directionManager.ifCycling()){
      directionManager.toggleCycling();
    }
    await pumpWidget(tester, WalkOrCycleToggle(directionManager: directionManager));

    final walkIcon = tester.widget(find.byIcon(Icons.directions_walk));
    final bikeIcon = tester.widget(find.byIcon(Icons.directions_bike));

    expect((walkIcon as Icon).color, Colors.red);
    expect((bikeIcon as Icon).color, Colors.black26);
  });

  testWidgets('When isCycling is true bikeIcon is red', (WidgetTester tester) async {
    DirectionManager directionManager = DirectionManager();
    if(!directionManager.ifCycling()){
      directionManager.toggleCycling();
    }
    await pumpWidget(tester, WalkOrCycleToggle());

    final walkIcon = tester.widget(find.byIcon(Icons.directions_walk));
    final bikeIcon = tester.widget(find.byIcon(Icons.directions_bike));

    expect((walkIcon as Icon).color, Colors.black26);
    expect((bikeIcon as Icon).color, Colors.red);
  });

  testWidgets('WalkOrCycleToggle button toggles isCycling', (WidgetTester tester) async {
    DirectionManager directionManager = DirectionManager();
    if(!directionManager.ifCycling()){
      directionManager.toggleCycling();
    }
    await pumpWidget(tester, WalkOrCycleToggle());

    expect(directionManager.ifCycling(), true);

    final toggleCycleButton = find.byType(ElevatedButton);
    await tester.tap(toggleCycleButton);

    expect(directionManager.ifCycling(), false);
  });
}
