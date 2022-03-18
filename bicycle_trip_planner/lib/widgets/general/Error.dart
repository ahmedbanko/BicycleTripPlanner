import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// text passed through depending on error
class Error extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          children: [
            SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,
            ),
            Text('No connection...'),
          ],
        ),
      ),
    );
  }
}
