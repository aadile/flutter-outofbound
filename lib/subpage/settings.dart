import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("settings Page OK");
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        child: Text("page settings")
      ),
    );
  }
}