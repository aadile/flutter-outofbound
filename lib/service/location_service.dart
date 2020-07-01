import 'dart:async';

import 'package:location/location.dart';
import 'package:out_of_bound_ato/model/user_location.dart';

class LocationService {
  // Keep track of current Location
  UserLocation _currentLocation;
  var location = Location();

  // Continuously emit location updates
  StreamController<UserLocation> _locationController = StreamController<UserLocation>.broadcast();

  Stream<UserLocation> get locationStream => _locationController.stream;

  LocationService() {
    print("here LocationService");
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _locationController.add(
                UserLocation(
                  latitude: locationData.latitude,
                  longitude: locationData.longitude,
                )
            );
          }
        });
      }
    });
  }

  Future<UserLocation> getLocation() async {
    try {
      print("here getLocation");
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }
}

