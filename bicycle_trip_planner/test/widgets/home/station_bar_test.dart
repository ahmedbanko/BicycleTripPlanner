import 'dart:io';
import 'package:bicycle_trip_planner/managers/DatabaseManager.dart';
import 'package:bicycle_trip_planner/widgets/home/StationBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../managers/firebase_mocks/firebase_auth_mocks.dart';
import '../../setUp.dart';
import 'station_bar_test.mocks.dart';

@GenerateMocks([DatabaseManager, FirebaseAuth])
void main() {
  final mockDatabaseManager = MockDatabaseManager();
  final mockFirebaseAuth = MockFirebaseAuth();

  setupFirebaseAuthMocks();

  setUpAll(() async {
    HttpOverrides.global = null;
    await Firebase.initializeApp();
  });

  testWidgets("StationBar has a title 'Nearby Stations'", (WidgetTester tester) async {
    await tester.runAsync(
            () async {
              await pumpWidget(tester, MaterialApp(home: Material(child:StationBar())));
              expect(find.text('Nearby Stations'), findsOneWidget);
        });
  });

  testWidgets("StationBar has an icon button 'firstPage'", (WidgetTester tester) async {
    await pumpWidget(tester, MaterialApp(home: Material(child:StationBar())));
    expect(find.widgetWithIcon(IconButton, Icons.first_page), findsOneWidget);
  });

  testWidgets("StationBar has an icon button 'expanded station list'", (WidgetTester tester) async {
    await pumpWidget(tester, MaterialApp(home: Material(child:StationBar())));
    expect(find.widgetWithIcon(IconButton, Icons.menu), findsOneWidget);
  });

  testWidgets("StationBar returns type container", (WidgetTester tester) async {
    await pumpWidget(tester, MaterialApp(home: Material(child:StationBar())));
    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets("StationBar returns type container", (WidgetTester tester) async {
    await pumpWidget(tester, MaterialApp(home: Material(child:StationBar())));
    final widget = find.byKey(ValueKey("first_page"));
    expect(widget, findsOneWidget);
  });

  testWidgets("Tapping menu icon returns another widget", (WidgetTester tester) async {
    await pumpWidget(tester, MaterialApp(home: Material(child:StationBar())));
    final widget = find.byKey(ValueKey("menu"));
    expect(widget, findsOneWidget);

    await tester.tap(widget);
    await tester.pump();
    expect(widget, findsOneWidget);

    final widget2 = find.byType(StatefulBuilder);
    expect(widget2, findsOneWidget);

    expect(find.byType(Expanded), findsWidgets);
    expect(find.byType(Container), findsWidgets);
  });

  testWidgets("StationBar returns type container", (WidgetTester tester) async {
    await pumpWidget(tester, MaterialApp(home: Material(child:StationBar())));
    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets("StationBar shows other options in dropdown when logged in", (WidgetTester tester) async {
    // when(mockDatabaseManager.()).thenAnswer((_) => true);
    when(mockFirebaseAuth.authStateChanges().listen((event) {}).onData((event) => true));

    await pumpWidget(tester, MaterialApp(home: Material(child:StationBar(auth: MockFirebaseAuth))));
    expect(find.byType(DropdownButton), findsOneWidget);
  });
}