import 'package:bicycle_trip_planner/bloc/application_bloc.dart';
import 'package:bicycle_trip_planner/managers/RouteManager.dart';
import 'package:bicycle_trip_planner/models/search_types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bicycle_trip_planner/widgets/routeplanning/IntermediateSearchList.dart';
import 'package:bicycle_trip_planner/widgets/general/Search.dart';
import 'package:provider/provider.dart';

class RouteCard extends StatefulWidget {
  const RouteCard({Key? key}) : super(key: key);

  @override
  _RouteCardState createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {

  TextEditingController startSearchController = TextEditingController();
  TextEditingController endSearchController = TextEditingController();

  final RouteManager routeManager = RouteManager();

  bool isShowingIntermediate = false;

  void toggleShowingIntermediate(){
    setState(()=> {isShowingIntermediate = !isShowingIntermediate});

  }

  @override
  Widget build(BuildContext context) {

    final applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);

    applicationBloc.selectedStation.stream.listen((event) { startSearchController.text = event.name;});
    routeManager.setStart(startSearchController.text);

    if(routeManager.ifStartSet() && routeManager.ifDestinationSet() && routeManager.ifChanged()){
      applicationBloc.findRoute(
          routeManager.getStart(),
          routeManager.getDestination(),
          routeManager.getIntermediates()
      );

      routeManager.clearChanged();
    }

    //TODO Find way to get current location faster
    // if(!routeManager.ifStartSet()){
    //   applicationBloc.setSelectedCurrentLocation(SearchType.start);
    // }

        return Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0,10),
                color: Colors.black45,
                blurRadius: 30.0,
              ),
            ],
          ),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(color: Color.fromRGBO(38, 36, 36, 1.0), width: 1.0),
            ),
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Search(
                                labelTextIn: "Starting Point",
                                searchController: startSearchController,
                                searchType: SearchType.start,
                            ),
                          ),
                          IntermediateSearchList(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Search(
                              labelTextIn: "Destination",
                              searchController: endSearchController,
                              searchType: SearchType.end,
                            ),
                          ),
                            // const Icon(Icons.expand_more),
                        ],
                      ),
                    ],
                  ),
          ),
        );
  }
}
