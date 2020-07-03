import 'package:flutter/material.dart';
import 'package:out_of_bound_ato/provider/location_provider.dart';
import 'package:provider/provider.dart';

class StartPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(builder: (context, _locationProvider, _) {
      print("Start Position Page OK");
      return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            child: _locationProvider.startingPosition == null
                ?  Text(
                "Please, click a button as start on page actual position, thank ")
                : Text(
                "My Last Position ${_locationProvider?.startingPosition.latitude} and ${_locationProvider.startingPosition.longitude}")
        ),
      );
    });
  }
}
