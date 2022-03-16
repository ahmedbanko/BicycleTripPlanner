import 'package:bicycle_trip_planner/constants.dart';
import 'package:bicycle_trip_planner/managers/RouteManager.dart';
import 'package:bicycle_trip_planner/widgets/general/CurrentLocationButton.dart';
import 'package:flutter/material.dart';
import 'package:bicycle_trip_planner/widgets/general/Search.dart';
import 'package:bicycle_trip_planner/widgets/home/StationBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../general/GroupSizeSelector.dart';

class HomeWidgets extends StatefulWidget {
  const HomeWidgets({Key? key}) : super(key: key);

  @override
  _HomeWidgetsState createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {

  final RouteManager routeManager = RouteManager(); 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Align(
            alignment: FractionalOffset.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ThemeStyle.cardColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Search(
                            labelTextIn: 'Search',
                            searchController: TextEditingController(),
                            uid: routeManager.getDestination().getUID(),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                              Icons.settings,
                              color: ThemeStyle.buttonPrimaryColor,
                          ),
                          onPressed: () => Navigator.pushNamed(context, '/settings'),
                          iconSize: 50,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
           Align(
              alignment: FractionalOffset.bottomCenter,
              child: Wrap(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Column(
                                children: [
                                  CurrentLocationButton(),
                                  SizedBox(height: 10),
                                  GroupSizeSelector(),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                  StationBar(),
                ],
              )
          ),
        ],
      ),
    );
  }
}
