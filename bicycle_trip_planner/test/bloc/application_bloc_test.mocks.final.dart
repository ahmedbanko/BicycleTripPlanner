// Mocks generated by Mockito 5.1.0 from annotations
// in bicycle_trip_planner/test/bloc/application_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i8;
import 'dart:convert' as _i11;
import 'dart:typed_data' as _i12;
import 'dart:ui' as _i10;

import 'package:bicycle_trip_planner/bloc/application_bloc.dart' as _i4;
import 'package:bicycle_trip_planner/models/place.dart' as _i7;
import 'package:bicycle_trip_planner/models/place_search.dart' as _i5;
import 'package:bicycle_trip_planner/models/station.dart' as _i6;
import 'package:bicycle_trip_planner/services/places_service.dart' as placeService;
import 'package:flutter/material.dart' as _i2;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i9;
import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:bicycle_trip_planner/managers/DialogManager.dart' as dialog;
import 'package:http/http.dart' as http;

import 'package:bicycle_trip_planner/managers/LocationManager.dart' as location;
// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeWidget_0 extends _i1.Fake implements _i2.Widget {
  @override
  String toString({_i2.DiagnosticLevel? minLevel = _i2.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeResponse_1 extends _i1.Fake implements _i3.Response {}

class _FakeStreamedResponse_2 extends _i1.Fake implements _i3.StreamedResponse {
}

/// A class which mocks [ApplicationBloc].
///
/// See the documentation for Mockito's code generation for more information.
/// 
class MockApplicationBloc extends _i1.Mock {
  MockApplicationBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Widget get selectedScreen =>
      (super.noSuchMethod(Invocation.getter(#selectedScreen),
          returnValue: _FakeWidget_0()) as _i2.Widget);
  @override
  set selectedScreen(_i2.Widget? _selectedScreen) =>
      super.noSuchMethod(Invocation.setter(#selectedScreen, _selectedScreen),
          returnValueForMissingStub: null);
  @override
  Map<String, _i2.Widget> get screens =>
      (super.noSuchMethod(Invocation.getter(#screens),
          returnValue: <String, _i2.Widget>{}) as Map<String, _i2.Widget>);

  late List<_i5.PlaceSearch> searchResults =[];
  late _i7.Place _currentLocation;

  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
      as bool);
  @override
  void showBinaryDialog(dialog.DialogManager dialogManager) =>
      dialogManager.showBinaryChoice();
  @override
  void showSelectedStationDialog(_i6.Station station, dialog.DialogManager dialogManager) {
    dialogManager.setSelectedStation(station);
    dialogManager.showSelectedStation();
  }
  @override
  void clearBinaryDialog(dialog.DialogManager dialogManager) =>
      dialogManager.clearBinaryChoice();
  @override
  void clearSelectedStationDialog(dialog.DialogManager dialogManager) =>
      dialogManager.clearSelectedStation();
  @override
  bool ifSearchResult() =>
      searchResults.isNotEmpty;
  @override
  dynamic searchPlaces(String searchTerm, http.Client client, placeService.PlacesService placesService) async {

     return await placesService.getAutocomplete(searchTerm);
  }

  getDefaultSearchResult() async {
    searchResults = [];
    searchResults.insert(
        0,
        _i5.PlaceSearch(
            description: "My current location",
            placeId: _currentLocation.placeId));
  }

  searchSelectedStation(_i6.Station station, int uid, placeService.PlacesService placesService) async {
    // Do not set new location marker. Use the station marker
    viewStationMarker(station, uid);

    if (station.place == const _i7.Place.placeNotFound()) {
      var client = http.Client();
      _i7.Place place = await placesService.getPlaceFromCoordinates(
          station.lat, station.lng, "Santander Cycles: ${station.name}");
      station.place = place;
    }

    setSelectedLocation(station.place, uid);
  }

  @override
  dynamic setSelectedSearch(int? searchIndex, int? uid) => super
      .noSuchMethod(Invocation.method(#setSelectedSearch, [searchIndex, uid]));
  @override
  dynamic setLocationMarker(_i7.Place? place, [int? uid = -1]) =>
      super.noSuchMethod(Invocation.method(#setLocationMarker, [place, uid]));
  @override
  dynamic setSelectedLocation(_i7.Place? stop, int? uid) =>
      super.noSuchMethod(Invocation.method(#setSelectedLocation, [stop, uid]));
  @override
  dynamic clearLocationMarker(int? uid) =>
      super.noSuchMethod(Invocation.method(#clearLocationMarker, [uid]));
  @override
  dynamic clearSelectedLocation(int? uid) =>
      super.noSuchMethod(Invocation.method(#clearSelectedLocation, [uid]));
  @override
  dynamic removeSelectedLocation(int? uid) =>
      super.noSuchMethod(Invocation.method(#removeSelectedLocation, [uid]));
  @override
  dynamic findRoute(_i7.Place? origin, _i7.Place? destination,
      [List<_i7.Place>? intermediates = const [], int? groupSize = 1]) =>
      super.noSuchMethod(Invocation.method(
          #findRoute, [origin, destination, intermediates, groupSize]));
  @override
  void endRoute() => super.noSuchMethod(Invocation.method(#endRoute, []),
      returnValueForMissingStub: null);
  @override
  bool getIsDestinationReached() =>
      (super.noSuchMethod(Invocation.method(#getIsDestinationReached, []),
          returnValue: false) as bool);
  @override
  dynamic updateStationsPeriodically(Duration? duration) => super
      .noSuchMethod(Invocation.method(#updateStationsPeriodically, [duration]));
  @override
  List<_i6.Station> filterNearbyStations() =>
      (super.noSuchMethod(Invocation.method(#filterNearbyStations, []),
          returnValue: <_i6.Station>[]) as List<_i6.Station>);
  @override
  dynamic filterStationsWithBikes(List<_i6.Station>? filteredStations) =>
      super.noSuchMethod(
          Invocation.method(#filterStationsWithBikes, [filteredStations]));
  @override
  void filterStationMarkers() =>
      super.noSuchMethod(Invocation.method(#filterStationMarkers, []),
          returnValueForMissingStub: null);
  @override
  dynamic viewStationMarker(_i6.Station? station, [int? uid = -1]) =>
      super.noSuchMethod(Invocation.method(#viewStationMarker, [station, uid]));
  @override
  _i2.Widget getSelectedScreen() =>
      (super.noSuchMethod(Invocation.method(#getSelectedScreen, []),
          returnValue: _FakeWidget_0()) as _i2.Widget);
  @override
  void setSelectedScreen(String? screenName) =>
      super.noSuchMethod(Invocation.method(#setSelectedScreen, [screenName]),
          returnValueForMissingStub: null);
  @override
  void goBack(String? backTo) =>
      super.noSuchMethod(Invocation.method(#goBack, [backTo]),
          returnValueForMissingStub: null);
  @override
  dynamic updateDirectionsPeriodically(Duration? duration) =>
      super.noSuchMethod(
          Invocation.method(#updateDirectionsPeriodically, [duration]));
  @override
  _i8.Future<void> startNavigation() =>
      (super.noSuchMethod(Invocation.method(#startNavigation, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> setNavigating(bool? value) =>
      (super.noSuchMethod(Invocation.method(#setNavigating, [value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  bool isWaypointPassed(_i9.LatLng waypoint, _i9.LatLng currentLocation, location.LocationManager locationManager) {
    return (locationManager.distanceFromToInMeters(currentLocation, waypoint) <= 30);
  }
  @override
  void passedStation(_i6.Station? station, void Function(bool)? functionA,
      void Function(bool)? functionB) =>
      super.noSuchMethod(
          Invocation.method(#passedStation, [station, functionA, functionB]),
          returnValueForMissingStub: null);
  @override
  void checkPassedByPickUpDropOffStations() => super.noSuchMethod(
      Invocation.method(#checkPassedByPickUpDropOffStations, []),
      returnValueForMissingStub: null);
  @override
  _i8.Future<bool> checkWaypointPassed() =>
      (super.noSuchMethod(Invocation.method(#checkWaypointPassed, []),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  void clearMap() => super.noSuchMethod(Invocation.method(#clearMap, []),
      returnValueForMissingStub: null);
  @override
  void addListener(_i10.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i10.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i3.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i3.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i8.Future<_i3.Response>);
  @override
  _i8.Future<_i3.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i8.Future<_i3.Response>);
  @override
  _i8.Future<_i3.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i8.Future<_i3.Response>);
  @override
  _i8.Future<_i3.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i8.Future<_i3.Response>);
  @override
  _i8.Future<_i3.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i8.Future<_i3.Response>);
  @override
  _i8.Future<_i3.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i11.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i3.Response>.value(_FakeResponse_1()))
          as _i8.Future<_i3.Response>);
  @override
  _i8.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<_i12.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i12.Uint8List>.value(_i12.Uint8List(0)))
          as _i8.Future<_i12.Uint8List>);
  @override
  _i8.Future<_i3.StreamedResponse> send(_i3.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_2()))
          as _i8.Future<_i3.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
