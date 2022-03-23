import 'package:bicycle_trip_planner/bloc/application_bloc.dart';
import 'package:bicycle_trip_planner/managers/DatabaseManager.dart';
import 'package:bicycle_trip_planner/managers/DirectionManager.dart';
import 'package:bicycle_trip_planner/managers/FavouriteRoutesManager.dart';
import 'package:bicycle_trip_planner/managers/RouteManager.dart';
import 'package:bicycle_trip_planner/managers/UserSettings.dart';
import 'package:bicycle_trip_planner/widgets/general/CircleButton.dart';
import 'package:bicycle_trip_planner/widgets/general/CustomBottomSheet.dart';
import 'package:bicycle_trip_planner/widgets/general/GroupSizeSelector.dart';
import 'package:bicycle_trip_planner/widgets/general/OptimisedButton.dart';
import 'package:bicycle_trip_planner/widgets/general/ViewRouteButton.dart';
import 'package:bicycle_trip_planner/widgets/general/WalkToFirstButton.dart';
import 'package:bicycle_trip_planner/widgets/general/DistanceETACard.dart';
import 'package:bicycle_trip_planner/widgets/general/CustomBackButton.dart';
import 'package:bicycle_trip_planner/widgets/general/RoundedRectangleButton.dart';
import 'package:bicycle_trip_planner/widgets/general/CurrentLocationButton.dart';
import 'package:bicycle_trip_planner/widgets/routeplanning/RouteCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'RecentRouteDisplay.dart';

class RoutePlanning extends StatefulWidget {
  RoutePlanning({Key? key}) : super(key: key);

  @override
  _RoutePlanningState createState() => _RoutePlanningState();
}

class _RoutePlanningState extends State<RoutePlanning> {
  bool showRouteCard = true;
  bool isOptimised = false;

  final RouteManager _routeManager = RouteManager();
  final UserSettings _userSettings = UserSettings();

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Visibility(
                    child: RouteCard(),
                    maintainState: true,
                    visible: showRouteCard),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      showRouteCard = false;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            !showRouteCard
                                ? CircleButton(
                                    iconIn: Icons.search,
                                    iconColor: ThemeStyle.primaryIconColor,
                                    onButtonClicked: () {
                                      setState(() {
                                        showRouteCard = true;
                                      });
                                    })
                                : Container(),
                            !showRouteCard ? SizedBox(height: 10) : Container(),
                            CurrentLocationButton(),
                            SizedBox(height: 10),
                            ViewRouteButton(),
                            SizedBox(height: 10),
                            GroupSizeSelector(),
                            SizedBox(height: 10),
                            OptimisedButton(),
                            SizedBox(height: 10),
                            WalkToFirstButton(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleButton(
                            iconIn: Icons.history,
                            iconColor: ThemeStyle.primaryIconColor,
                            onButtonClicked: () => showRecentRoutes()),
                        Spacer(),
                        CustomBackButton(context: context, backTo: 'home'),
                      ]),
                ),
                CustomBottomSheet(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Wrap(
                          children: [DistanceETACard()],
                        ),
                        Spacer(),
                        DatabaseManager().isUserLogged()
                            ? SizedBox(
                                width: 50,
                                child: ElevatedButton(
                                    onPressed: () {
                                      saveRoute(context);
                                    },
                                    child: Icon(
                                      Icons.save,
                                      color: ThemeStyle.secondaryFontColor,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(17.0),
                                      ),
                                      primary: ThemeStyle.buttonSecondaryColor,
                                    )))
                            : Container(),
                        Spacer(),
                        Expanded(
                          flex: 20,
                          child: RoundedRectangleButton(
                              iconIn: Icons.directions_bike,
                              buttonColor: ThemeStyle.goButtonColor,
                              onButtonClicked: () {
                                if (_routeManager.ifRouteSet()) {
                                  // TODO: call method here that stores the route
                                  applicationBloc.startNavigation();
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("No route could be found!"),
                                  ));
                                }
                              }),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showRecentRoutes() async {
    int noRoutes = await _userSettings.getNumberOfRoutes();
    showModalBottomSheet(
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
                color: ThemeStyle.cardColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                boxShadow: [
                  BoxShadow(
                    color: ThemeStyle.stationShadow,
                    spreadRadius: 8,
                    blurRadius: 6,
                    offset: Offset(0, 0),
                  )
                ]),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.165,
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: FutureBuilder<Map<String, dynamic>>(
                                    future: _userSettings.getRoute(),
                                    builder: (context, snapshot) {
                                      return ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: noRoutes, // number of cards
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            // This could be null when user has no stored routes (fresh phone)
                                            // Ensure that no route card is printed (Or don't show this widget)
                                            // if there is no recent routes and show a snackbar for an error
                                            Map<String, dynamic>? route =
                                                snapshot.data!["${index + 1}"];
                                            return RecentRouteCard(
                                                route: route);
                                          });
                                    })),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}

saveRoute(context) async {
  final databaseManager = DatabaseManager();
  final routeManager = RouteManager();
  final FavouriteRoutesManager favouriteRoutesManager =
      FavouriteRoutesManager();

  bool successfullyAdded = await databaseManager
      .addToFavouriteRoutes(
          routeManager.getStart().getStop(),
          routeManager.getDestination().getStop(),
          routeManager
              .getWaypoints()
              .map((waypoint) => waypoint.getStop())
              .toList())
      .then((v) {
    favouriteRoutesManager.updateRoutes();
    return v;
  });
  ;
  if (successfullyAdded) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Route saved correctly!"),
    ));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Error while saving the route!"),
    ));
  }
}
