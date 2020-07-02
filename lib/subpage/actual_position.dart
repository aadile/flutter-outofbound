import 'package:flutter/material.dart';
import 'package:out_of_bound_ato/provider/location_provider.dart';
import 'package:provider/provider.dart';

class ActualPosition extends StatefulWidget {
  @override
  _ActualPositionState createState() => _ActualPositionState();
}

class _ActualPositionState extends State<ActualPosition> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
      builder: (context, _locationProvider, _) {
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
                          "page Actual Position latitude ${_locationProvider.currentPosition?.latitude}  and longitude ${_locationProvider.currentPosition?.longitude}"),
                      Text(_locationProvider.startingPosition == null
                          ? "Press on button Make as start to get position actual"
                          : "Position actual Latitude ${_locationProvider.startingPosition?.latitude} and Longitude ${_locationProvider.startingPosition?.longitude}"),
                      FlatButton(
                        color: Colors.amber,
                        onPressed: () {
                          _locationProvider.setStartingPosition();
                          print("_currentLocation ${_locationProvider.startingPosition?.latitude}");
                        },
                        child: Text("Make as start"),
                      )
                    ])));

      }
    );


  }
}
