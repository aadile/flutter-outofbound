import 'package:flutter/material.dart';
import 'package:out_of_bound_ato/model/user_location.dart';
import 'package:provider/provider.dart';

class ActualPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    print("page Actual Position " +
        userLocation?.latitude.toString() +
        " and " +
        userLocation?.longitude.toString());

    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        child: Text(
            "page Actual Position latitude ${userLocation?.latitude}  and longitude ${userLocation?.longitude}"),
      ),
    );
  }
}
