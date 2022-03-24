import 'package:bicycle_trip_planner/models/geometry.dart';
import 'package:bicycle_trip_planner/models/location.dart';
import 'package:test/test.dart';
import 'package:bicycle_trip_planner/models/place.dart';

main(){
  final location = Location(lat: 1, lng: -1);
  final geometry = Geometry(location: location);
  final place = Place(geometry: geometry, name: "Bush House", placeId: "1", description: "");

  test('ensure geometry is Geometry', (){
    expect(place.geometry.runtimeType, Geometry);
  });

  test('ensure name is String', (){
    expect(place.name.runtimeType, String);
  });

  test('ensure placeId is String', (){
    expect(place.placeId.runtimeType, String);
  });

  test('ensure can get LatLng of place', (){
    expect(place.getLatLng().latitude, geometry.location.lat);
    expect(place.getLatLng().longitude, geometry.location.lng);
  });

  test('ensure overridden toString is correct', (){
    expect(place.toString(), place.description);
  });

}