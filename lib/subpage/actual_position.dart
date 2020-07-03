import 'package:flutter/material.dart';
import 'package:out_of_bound_ato/provider/location_provider.dart';
import 'package:provider/provider.dart';

class ActualPosition extends StatefulWidget {
  @override
  _ActualPositionState createState() => _ActualPositionState();
}

class _ActualPositionState extends State<ActualPosition> {
  double _distance;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(builder: (context, _locationProvider, _) {
      print("page Actual Position " +
          _locationProvider.currentPosition?.latitude.toString() +
          " and " +
          _locationProvider.currentPosition?.longitude.toString());

      _locationProvider.initLocationProvider();

      return Scaffold(
          backgroundColor: Colors.red,
          body: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        "Current POsition ${_locationProvider?.currentPosition?.latitude.toString()} and ${_locationProvider?.currentPosition?.longitude.toString()}"),
                    Text(_locationProvider.distance == null
                        ? "Please move or wait to have GPS to detect an actual position and check a button mark as position if you don't do it"
                        : "actually at ${_locationProvider.distance} meters from the starting point"),
                    Text(_locationProvider.startingPosition == null
                        ? "Press on button Make as start to get position actual"
                        : "Position actual Latitude ${_locationProvider.startingPosition?.latitude} and Longitude ${_locationProvider.startingPosition?.longitude}"),
                    FlatButton(
                      color: Colors.amber,
                      onPressed: () {
                        _locationProvider.setStartingPosition();
                        print(
                            "_currentLocation ${_locationProvider.startingPosition?.latitude}");
                      },
                      child: Text("Make as start"),
                    )
                  ])));
    });
  }
}
