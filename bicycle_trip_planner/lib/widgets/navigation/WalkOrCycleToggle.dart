import 'package:bicycle_trip_planner/constants.dart';
import 'package:bicycle_trip_planner/managers/DialogManager.dart';
import 'package:bicycle_trip_planner/managers/DirectionManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/application_bloc.dart';

class WalkOrCycleToggle extends StatefulWidget {
  final DirectionManager directionManager;

  const WalkOrCycleToggle({Key? key, required this.directionManager})
      : super(key: key);

  @override
  _WalkOrCycleToggleState createState() => _WalkOrCycleToggleState();
}

class _WalkOrCycleToggleState extends State<WalkOrCycleToggle> {
  late final ApplicationBloc applicationBloc;
  final DialogManager _dialogManager = DialogManager();

  void setCycling() {
    setState(() => {applicationBloc.toggleCycling()});
  }

  @override
  void initState() {
    applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(ThemeStyle.buttonSecondaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.directions_walk,
            color: widget.directionManager.ifCycling()
                ? Colors.black26
                : Colors.red,
            size: 30,
          ),
          const Text(
            '/',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          Icon(
            Icons.directions_bike,
            color: widget.directionManager.ifCycling()
                ? Colors.red
                : Colors.black26,
            size: 30,
          ),
        ],
      ),
      onPressed: () {
<<<<<<< Updated upstream
        _dialogManager.showWalkBikeToggleDialog();
=======
        _dialogManager.setBinaryChoice(
          "Toggle between walking and cycling?",
          "Toggle",
              () {
            applicationBloc.toggleCycling();
          },
          "Cancel",
              () {},
        );

        applicationBloc.showBinaryDialog();

>>>>>>> Stashed changes
        applicationBloc.notifyListeningWidgets();
      },
    );
  }
}
