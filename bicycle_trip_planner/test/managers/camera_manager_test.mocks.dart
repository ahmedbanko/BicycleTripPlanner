// Mocks generated by Mockito 5.1.0 from annotations
// in bicycle_trip_planner/test/managers/camera_manager_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;
import 'dart:typed_data' as _i5;

import 'package:bicycle_trip_planner/bloc/application_bloc.dart' as _i9;
import 'package:bicycle_trip_planner/managers/MarkerManager.dart' as _i6;
import 'package:bicycle_trip_planner/models/place.dart' as _i7;
import 'package:bicycle_trip_planner/models/station.dart' as _i8;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i3;
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeLatLngBounds_0 extends _i1.Fake implements _i2.LatLngBounds {}

class _FakeScreenCoordinate_1 extends _i1.Fake implements _i2.ScreenCoordinate {
}

class _FakeLatLng_2 extends _i1.Fake implements _i2.LatLng {}

class _FakeMarker_3 extends _i1.Fake implements _i2.Marker {}

/// A class which mocks [GoogleMapController].
///
/// See the documentation for Mockito's code generation for more information.
class MockGoogleMapController extends _i1.Mock
    implements _i3.GoogleMapController {
  MockGoogleMapController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get mapId =>
      (super.noSuchMethod(Invocation.getter(#mapId), returnValue: 0) as int);
  @override
  _i4.Future<void> clearTileCache(_i2.TileOverlayId? tileOverlayId) =>
      (super.noSuchMethod(Invocation.method(#clearTileCache, [tileOverlayId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> animateCamera(_i2.CameraUpdate? cameraUpdate) =>
      (super.noSuchMethod(Invocation.method(#animateCamera, [cameraUpdate]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> moveCamera(_i2.CameraUpdate? cameraUpdate) =>
      (super.noSuchMethod(Invocation.method(#moveCamera, [cameraUpdate]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> setMapStyle(String? mapStyle) =>
      (super.noSuchMethod(Invocation.method(#setMapStyle, [mapStyle]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<_i2.LatLngBounds> getVisibleRegion() => (super.noSuchMethod(
          Invocation.method(#getVisibleRegion, []),
          returnValue: Future<_i2.LatLngBounds>.value(_FakeLatLngBounds_0()))
      as _i4.Future<_i2.LatLngBounds>);
  @override
  _i4.Future<_i2.ScreenCoordinate> getScreenCoordinate(_i2.LatLng? latLng) =>
      (super.noSuchMethod(Invocation.method(#getScreenCoordinate, [latLng]),
              returnValue:
                  Future<_i2.ScreenCoordinate>.value(_FakeScreenCoordinate_1()))
          as _i4.Future<_i2.ScreenCoordinate>);
  @override
  _i4.Future<_i2.LatLng> getLatLng(_i2.ScreenCoordinate? screenCoordinate) =>
      (super.noSuchMethod(Invocation.method(#getLatLng, [screenCoordinate]),
              returnValue: Future<_i2.LatLng>.value(_FakeLatLng_2()))
          as _i4.Future<_i2.LatLng>);
  @override
  _i4.Future<void> showMarkerInfoWindow(_i2.MarkerId? markerId) =>
      (super.noSuchMethod(Invocation.method(#showMarkerInfoWindow, [markerId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> hideMarkerInfoWindow(_i2.MarkerId? markerId) =>
      (super.noSuchMethod(Invocation.method(#hideMarkerInfoWindow, [markerId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<bool> isMarkerInfoWindowShown(_i2.MarkerId? markerId) => (super
      .noSuchMethod(Invocation.method(#isMarkerInfoWindowShown, [markerId]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<double> getZoomLevel() =>
      (super.noSuchMethod(Invocation.method(#getZoomLevel, []),
          returnValue: Future<double>.value(0.0)) as _i4.Future<double>);
  @override
  _i4.Future<_i5.Uint8List?> takeSnapshot() =>
      (super.noSuchMethod(Invocation.method(#takeSnapshot, []),
              returnValue: Future<_i5.Uint8List?>.value())
          as _i4.Future<_i5.Uint8List?>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [MarkerManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockMarkerManager extends _i1.Mock implements _i6.MarkerManager {
  MockMarkerManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set userMarkerIcon(_i2.BitmapDescriptor? _userMarkerIcon) =>
      super.noSuchMethod(Invocation.setter(#userMarkerIcon, _userMarkerIcon),
          returnValueForMissingStub: null);
  @override
  _i4.Stream<Set<_i2.Marker>> get mapMarkerStream =>
      (super.noSuchMethod(Invocation.getter(#mapMarkerStream),
              returnValue: Stream<Set<_i2.Marker>>.empty())
          as _i4.Stream<Set<_i2.Marker>>);
  @override
  void setMarker(_i2.LatLng? point, String? markerID, [double? color = 0.0]) =>
      super.noSuchMethod(
          Invocation.method(#setMarker, [point, markerID, color]),
          returnValueForMissingStub: null);
  @override
  void removeMarker(String? markerID) =>
      super.noSuchMethod(Invocation.method(#removeMarker, [markerID]),
          returnValueForMissingStub: null);
  @override
  Set<_i2.Marker> getMarkers() =>
      (super.noSuchMethod(Invocation.method(#getMarkers, []),
          returnValue: <_i2.Marker>{}) as Set<_i2.Marker>);
  @override
  _i2.Marker getUserMarker() =>
      (super.noSuchMethod(Invocation.method(#getUserMarker, []),
          returnValue: _FakeMarker_3()) as _i2.Marker);
  @override
  void clearMarker(int? uid) =>
      super.noSuchMethod(Invocation.method(#clearMarker, [uid]),
          returnValueForMissingStub: null);
  @override
  void setPlaceMarker(_i7.Place? place, [int? uid = -1]) =>
      super.noSuchMethod(Invocation.method(#setPlaceMarker, [place, uid]),
          returnValueForMissingStub: null);
  @override
  void setStationMarkerWithUID(
          _i8.Station? station, _i9.ApplicationBloc? appBloc,
          [int? uid = -1]) =>
      super.noSuchMethod(
          Invocation.method(#setStationMarkerWithUID, [station, appBloc, uid]),
          returnValueForMissingStub: null);
  @override
  _i4.Future<_i2.Marker> setUserMarker(_i2.LatLng? point) =>
      (super.noSuchMethod(Invocation.method(#setUserMarker, [point]),
              returnValue: Future<_i2.Marker>.value(_FakeMarker_3()))
          as _i4.Future<_i2.Marker>);
  @override
  void setStationMarker(_i8.Station? station, _i9.ApplicationBloc? appBloc) =>
      super.noSuchMethod(
          Invocation.method(#setStationMarker, [station, appBloc]),
          returnValueForMissingStub: null);
  @override
  void setStationMarkers(
          List<_i8.Station>? stations, _i9.ApplicationBloc? appBloc) =>
      super.noSuchMethod(
          Invocation.method(#setStationMarkers, [stations, appBloc]),
          returnValueForMissingStub: null);
  @override
  void clearStationMarkers(List<_i8.Station>? stations) =>
      super.noSuchMethod(Invocation.method(#clearStationMarkers, [stations]),
          returnValueForMissingStub: null);
}