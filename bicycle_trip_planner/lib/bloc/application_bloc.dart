import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bicycle_trip_planner/models/direction.dart';
import 'package:bicycle_trip_planner/models/place.dart';
import 'package:bicycle_trip_planner/models/place_search.dart';
import 'package:bicycle_trip_planner/services/directions_service.dart';
import 'package:bicycle_trip_planner/services/places_service.dart';

class ApplicationBloc with ChangeNotifier {
  final placesService = PlacesService();
  final directionsService = DirectionsService();

  List<PlaceSearch> searchResults = List.empty();
  StreamController<Direction> currentDirection = StreamController<Direction>();
  StreamController<Place> selectedLocation = StreamController<Place>();

  bool ifSearchResult(){
    return searchResults.isNotEmpty;
  }

  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }

  setSelectedLocation(String placeId) async {
    selectedLocation.add(await placesService.getPlace(placeId));
    searchResults.clear();
    notifyListeners();
  }

  findRouteDirection(String origin, String destination) async {
    currentDirection
        .add(await directionsService.getDirections(origin, destination));
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    selectedLocation.close();
    super.dispose();
  }
}