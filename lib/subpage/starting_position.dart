import 'package:flutter/material.dart';

class StartPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Start Position Page OK");
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          child: Text("page Start Position")
      ),
    );
  }
}