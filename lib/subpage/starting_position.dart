import 'package:flutter/material.dart';
import 'package:out_of_bound_ato/provider/location_provider.dart';
import 'package:out_of_bound_ato/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class StartPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LocationProvider, SettingsProvider>(builder: (context, _locationProvider, _settingsProvider, _) {
      print("Start Position Page OK");
      print("Start Position Page boundary ${_settingsProvider.boundary}");
      print("Start Position Page => EnableAlert ${_settingsProvider.isEnableAlert}");

      return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(_locationProvider.startingPosition == null
                  ? "Please, click a button as start on page actual position, thank "
                  : "My Last Position ${_locationProvider?.startingPosition?.latitude} and ${_locationProvider.startingPosition?.longitude}"),
              Text(_locationProvider.distance == null
                  ? "Please move or wait to have GPS to detect an actual position and check a button mark as position if you don't do it"
                  : "actually at ${_locationProvider.distance} meters from this point "),
            ])),
      );
    });
  }
}
