import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:out_of_bound_ato/provider/location_provider.dart';
import 'package:out_of_bound_ato/provider/settings_provider.dart';
import 'package:out_of_bound_ato/service/notification_service.dart';
import 'package:provider/provider.dart';

class ActualPosition extends StatefulWidget {
  @override
  _ActualPositionState createState() => _ActualPositionState();
}

class _ActualPositionState extends State<ActualPosition> {
  double _distance;
  bool _alreadyAsk = false;
  bool _isAlreadyShowAlert = false;

  NotificationService _notificationService;

  @override
  void initState() {
    super.initState();
    _notificationService = new NotificationService();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LocationProvider, SettingsProvider>(
        builder: (context, _locationProvider, _settingsProvider, _) {
      if (!_alreadyAsk) {
        _locationProvider.checkRequestPermission();
        _alreadyAsk = !_alreadyAsk;
      }

      print("page Actual Position " +
          _locationProvider.currentPosition?.latitude.toString() +
          " and " +
          _locationProvider.currentPosition?.longitude.toString());

      print("page Actual Position => Boundary ${_settingsProvider.boundary}");

      print(
          "page Actual Position => EnableAlert ${_settingsProvider.isEnableAlert}");

      _locationProvider.listenChangeLocation();

      _distance = _locationProvider.distance;

      print("page Actual Position => Distance $_distance");

      if (_settingsProvider.isEnableAlert &&
          _settingsProvider.boundary != null &&
          _distance != null &&
          _distance > _settingsProvider.boundary) {
        print(
            "pin pon pin pon pin pon out boundary $_distance and boundary is ${_settingsProvider.boundary}");
        if (!_isAlreadyShowAlert) {
          _notificationService.showNotificationOutOfBounds(
              (_distance - _settingsProvider.boundary));
          _isAlreadyShowAlert = true;
        }
      } else if (_isAlreadyShowAlert) {
        _notificationService.showNotificationBackInBounds();
        _isAlreadyShowAlert = false;
      }

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
                    Text(_distance == null
                        ? "Please move or wait to have GPS to detect an actual position and check a button mark as position if you don't do it"
                        : "actually at ${_distance} meters from the starting point"),
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
