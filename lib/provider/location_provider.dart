import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class LocationProvider extends ChangeNotifier {
  LocationData _currentPosition;
  LocationData _startingPosition;

  double _distance;

  var location = Location();
  var geoLocator = Geolocator();

  void setStartingPosition() {
    location.getLocation().then((value) {
      this._startingPosition = value;
    });

    this.getDistance();
    notifyListeners();
  }

  void initLocationProvider() {
    print("here LocationService");
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _currentPosition = locationData;
            this.getDistance();
            notifyListeners();
          }
        });
      }
    });
  }

  Future<void> getDistance() async {
    this.currentPosition == null || this.startingPosition == null
        ? _distance = null
        : _distance = await geoLocator.distanceBetween(
            this.startingPosition?.latitude,
            this.startingPosition?.longitude,
            this.currentPosition?.latitude,
            this.currentPosition?.longitude);
  }

  LocationData get currentPosition => _currentPosition;
  LocationData get startingPosition => _startingPosition;
  double get distance => _distance;
}
