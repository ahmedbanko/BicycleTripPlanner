import 'package:bicycle_trip_planner/widgets/Map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import '../constants.dart';
import 'Directions.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  bool cycling = false;
  bool mapZoomed = false;

  void setCycling() {
    setState(() => {cycling = !cycling});
  }

  void setMapZoomInOut() {
    setState(() => {mapZoomed = !mapZoomed});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          MapWidget(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Directions(),
                const Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  FloatingActionButton(
                    onPressed: () => {},
                    child: const Icon(Icons.location_on),
                  )
                ]),
                const Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  FloatingActionButton(
                      onPressed: setMapZoomInOut,
                      child: mapZoomed
                          ? const Icon(Icons.zoom_out_map)
                          : const Icon(Icons.fullscreen_exit, size: 40)),
                ]),
                const Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Color(0xFF8B0000), width: 1),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: const Text(
                          "12 : 02",
                          style: TextStyle(
                            color: Color(0xFF8B0000),
                          ),
                        )),
                  )
                ]),
                Spacer(flex: 50),
                Row(
                  children: [
                    Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Column(children: const [
                                Icon(Icons.timer),
                                Text("[ETA]")
                              ]),
                              const Text("3.5 miles")
                            ],
                          ),
                        )),
                    const Spacer(flex: 1),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.directions_walk,
                            color: cycling ? Colors.black26 : Colors.red,
                            size: 30,
                          ),
                          const Text(
                            '/',
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                          Icon(
                            Icons.directions_bike,
                            color: cycling ? Colors.red : Colors.black26,
                            size: 30,
                          ),
                        ],
                      ),
                      onPressed: () {
                        setCycling();
                      },
                    ),
                    const Spacer(flex: 10),
                    FloatingActionButton(
                        onPressed: () => {},
                        backgroundColor: Colors.red,
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                          size: 35,
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
