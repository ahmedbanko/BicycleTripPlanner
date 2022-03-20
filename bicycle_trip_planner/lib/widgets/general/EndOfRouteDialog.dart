import 'package:bicycle_trip_planner/bloc/application_bloc.dart';
import 'package:bicycle_trip_planner/constants.dart';
import 'package:bicycle_trip_planner/managers/DialogManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EndOfRouteDialog extends StatefulWidget {
  const EndOfRouteDialog({Key? key}) : super(key: key);

  @override
  _EndOfRouteDialogState createState() => _EndOfRouteDialogState();
}

class _EndOfRouteDialogState extends State<EndOfRouteDialog> {
  final DialogManager _dialogManager = DialogManager();

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context, listen: true);

    if (!_dialogManager.ifShowingEndOfRouteDialog()) {
      return  const SizedBox.shrink();
    } else {
      return Dialog(
          backgroundColor: ThemeStyle.cardColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Expanded(
                        child: Text(_dialogManager.getEndOfRouteDialogText(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ThemeStyle.primaryTextColor)
                        )),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromWidth(double.infinity),
                            primary: ThemeStyle.buttonPrimaryColor
                        ),
                        onPressed: () {
                          (_dialogManager.getEndOfRouteFunction())();
                          applicationBloc.clearEndOfRouteDialog();
                        },
                        // onPressed: YesOption();
                        child: Text(_dialogManager.getOkButtonText(),
                            style: TextStyle(color: ThemeStyle.primaryTextColor)),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )),
      );
    }
}}




// void showEndRouteDialog(ApplicationBloc applicationBloc) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//               borderRadius:
//               BorderRadius.circular(20.0)
//           ),
//           child: Container(
//               height: 200,
//               child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 10),
//                     Expanded(child: Text("You have reached your destination!", textAlign: TextAlign.center)),
//                     Expanded(
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             minimumSize: Size.fromWidth(double.infinity)
//                         ),
//                         onPressed: (){
//                           applicationBloc.endRoute();
//                           applicationBloc.setSelectedScreen('home');
//                           Navigator.pop(context);
//                         },
//                         child: Text("Ok"),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//           ),
//         );
//       });
// }
