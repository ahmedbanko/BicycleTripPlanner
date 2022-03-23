import 'dart:async';
import 'package:bicycle_trip_planner/bloc/application_bloc.dart';
import 'package:bicycle_trip_planner/constants.dart';
import 'package:bicycle_trip_planner/managers/RouteManager.dart';
import 'package:bicycle_trip_planner/managers/UserSettings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/pathway.dart';

class RecentRouteCard extends StatefulWidget {

  const RecentRouteCard(
      {Key? key})
      : super(key: key);

  @override
  _RouteCardState createState() => _RouteCardState();
}

class _RouteCardState extends State<RecentRouteCard> {
  final UserSettings _userSettings = UserSettings();

  String route = "";

  _RouteCardState() {
    _userSettings.getRoute().then((val) => setState(() {
      route = val;
    }));
  }

  @override
  Widget build(BuildContext context) {
    // final applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);
    return InkWell(
      // onTap: () {
      //   Navigator.of(context).maybePop();
      //   routeClicked(applicationBloc,
      //       favouriteRoutesManager.getFavouriteRouteByIndex(widget.index)!, context);
      // },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Card(
            color: ThemeStyle.cardColor,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        size: 20.0,
                        color: ThemeStyle.secondaryIconColor,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.85) - 70.0,
                        child:
                        Text(
                          //"\t\t${favouriteRoutesManager.getFavouriteRouteByIndex(widget.index)!.getStart().getStop().name}",
                          route,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: ThemeStyle.secondaryTextColor),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(children: [SizedBox(width: 8.0,), Icon(Icons.circle, size: 4.0, color: ThemeStyle.secondaryIconColor,)]),
                  Spacer(),
                  Row(
                      children: [
                        SizedBox(width: 8.0,),
                        Icon(Icons.circle, size: 4.0, color: ThemeStyle.secondaryIconColor,),
                        SizedBox(width: 8.0,),
                        SizedBox(
                            width: (MediaQuery.of(context).size.width * 0.85) - 70.0,
                            child:
                            Text(
                                // "\t\t${favouriteRoutesManager.getFavouriteRouteByIndex(widget.index)!.getWaypoints().map((e) => e.getStop().name).join(", ")}",
                                "middle",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 15.0, color: ThemeStyle.secondaryFontColor,)
                            )
                        ),
                        SizedBox(width: 20),
                      ]
                  ),
                  Spacer(),
                  Row(children: [SizedBox(width: 8.0,), Icon(Icons.circle, size: 4.0, color: ThemeStyle.secondaryIconColor,)]),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.place,
                        size: 20.0,
                        color: ThemeStyle.secondaryIconColor,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.85) - 80.0,
                        child: Text(
                          // "\t\t${favouriteRoutesManager.getFavouriteRouteByIndex(widget.index)!.getDestination().getStop().name}",
                          "end",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: ThemeStyle.secondaryTextColor),
                        ),
                      ),
                      Spacer(flex: 5,),
                      const Spacer(flex: 1),
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}

Future<void> routeClicked(
    ApplicationBloc appBloc, Pathway pathway, context) async {
  RouteManager routeManager = RouteManager();
  routeManager.getStart().setStop(pathway.getStart().getStop());
  routeManager.getDestination().setStop(pathway.getDestination().getStop());
  routeManager.removeWaypoints();
  pathway.getWaypoints().forEach((element) {routeManager.addWaypoint(element.getStop());});

  appBloc.setSelectedScreen('routePlanning');

  appBloc.findRoute(
      routeManager.getStart().getStop(),
      routeManager.getDestination().getStop(),
      routeManager
          .getWaypoints()
          .map((waypoint) => waypoint.getStop())
          .toList(),
      routeManager.getGroupSize());
}
