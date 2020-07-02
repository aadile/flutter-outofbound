import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:out_of_bound_ato/model/user_location.dart';

class LocationProvider extends ChangeNotifier {

  UserLocation _currentPosition;
  UserLocation _startingPosition;

  var location = Location();


  void setStartingPosition() {
    _startingPosition = _currentPosition;
    notifyListeners();
  }


  void initLocationProvider() {
    print("here LocationService");
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _currentPosition =
                UserLocation(
                  latitude: locationData.latitude,
                  longitude: locationData.longitude,
                );
            notifyListeners();
          }
        });
      }
    });
  }

  void lastPosition(UserLocation last) {
    _startingPosition = last;
    notifyListeners();
  }

  UserLocation get currentPosition => _currentPosition;
  UserLocation get startingPosition => _startingPosition;

}