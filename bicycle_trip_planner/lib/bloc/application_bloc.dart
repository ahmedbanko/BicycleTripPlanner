import 'dart:async';
import 'package:bicycle_trip_planner/managers/MarkerManager.dart';
import 'package:bicycle_trip_planner/managers/StationManager.dart';
import 'package:bicycle_trip_planner/models/locator.dart';
import 'package:bicycle_trip_planner/models/search_types.dart';
import 'package:bicycle_trip_planner/widgets/home/HomeWidgets.dart';
import 'package:bicycle_trip_planner/widgets/navigation/Navigation.dart';
import 'package:bicycle_trip_planner/widgets/routeplanning/RoutePlanning.dart';
import 'package:flutter/material.dart';

import 'package:bicycle_trip_planner/models/station.dart';
import 'package:bicycle_trip_planner/models/route.dart' as Rou;
import 'package:bicycle_trip_planner/models/place.dart';
import 'package:bicycle_trip_planner/models/place_search.dart';
import 'package:bicycle_trip_planner/services/directions_service.dart';
import 'package:bicycle_trip_planner/services/places_service.dart';
import 'package:bicycle_trip_planner/services/stations_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApplicationBloc with ChangeNotifier {
  
  final _placesService = PlacesService();
  final _directionsService = DirectionsService();
  final _stationsService = StationsService();
  Widget selectedScreen = HomeWidgets();
  final screens = <String, Widget>{
    'home': HomeWidgets(),
    'navigation': Navigation(),
    'routePlanning': RoutePlanning(),
  };
  
  Rou.Route? route; // TODO: Potential refactor on route here
  List<PlaceSearch> searchResults = List.empty();

  StreamController<Rou.Route> currentRoute = StreamController<Rou.Route>.broadcast();
  StreamController<Place> selectedLocation = StreamController<Place>.broadcast();
  StreamController<LatLng> currentLocation = StreamController<LatLng>.broadcast();

  final StationManager _stationManager = StationManager();
  final MarkerManager _markerManager = MarkerManager();

  late Timer _stationTimer;

  cancelStationTimer(){
    _stationTimer.cancel(); 
  }

  updateStationsPeriodically(Duration duration){
    _stationTimer = Timer.periodic(duration, (timer){
      updateStations(); 
    });  
  }

  setupStations() async{
    List<Station> stations = await _stationsService.getStations();
    _stationManager.setStations(stations);
    _markerManager.setStationMarkers(stations, this);
    updateStations();
    notifyListeners();
  }

  updateStations() async {
    await _stationManager.setStations(await _stationsService.getStations());
    notifyListeners(); 
  }

  bool ifSearchResult(){
    return searchResults.isNotEmpty;
  }

  searchPlaces(String searchTerm) async {
    searchResults = await _placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }

  setSelectedLocation(String placeId, SearchType searchType, [int intermediateIndex = 0]) async {
    Place selected = await _placesService.getPlace(placeId);

    selectedLocation.add(selected);
    _markerManager.setPlaceMarker(selected, searchType, intermediateIndex);

    searchResults.clear();
    notifyListeners();
  }

  clearSelectedLocation(SearchType searchType, [int intermediateIndex = 0]){
    _markerManager.clearMarker(searchType, intermediateIndex);

    notifyListeners();
  }

  viewCurrentLocation() async {
    Locator _locator = Locator();
    currentLocation.add(await _locator.locate());
    notifyListeners();
  }

  findRoute(String origin, String destination, [List<String> intermediates = const <String>[]]) async {
    route = await _directionsService.getRoutes(origin, destination, intermediates);
    currentRoute.add(route!); 
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    selectedLocation.close();
    super.dispose();
  }

  Widget getSelectedScreen() {
    return selectedScreen;
  }

  void setSelectedScreen(String screenName, {String selectedStartStation = ""}) {
    if (selectedStartStation == "")
      selectedScreen = screens[screenName] ?? HomeWidgets();
    else
      selectedScreen = RoutePlanning(selectedStation: selectedStartStation);
    notifyListeners();
  }
}
