import 'package:flutter/material.dart';

const TEXT_SIZE = 9.0;
const ICON_SIZE = 12.0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Welcome to World Flutter", home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedButton = 0;
  final choiceButton = [StartPosition(), ActualPosition(), SettingsPage()];
  final choiceColorButton = [Colors.blue, Colors.red, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hello World")),
        body: choiceButton[selectedButton],
        backgroundColor: choiceColorButton[selectedButton],
        bottomNavigationBar: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: RaisedButton.icon(
                        onPressed: () {
                          setState(() {
                            selectedButton = 0;
                            print("selected Button Starting Location");
                          });
                        },
                        icon: Icon(Icons.location_city),
                        label: Flexible(
                            child: Text("Starting location",
                                style: new TextStyle(fontSize: TEXT_SIZE),
                                textAlign: TextAlign.center)),
                        color: Colors.blue,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                  ),
                  Expanded(
                      child: RaisedButton.icon(
                          onPressed: () {
                            setState(() {
                              selectedButton = 1;
                              print("selected Button Actual Location");
                            });
                          },
                          icon: Icon(Icons.my_location),
                          label: Flexible(
                              child: Text("Actual Position",
                                  style: new TextStyle(fontSize: TEXT_SIZE),
                                  textAlign: TextAlign.center)),
                          color: Colors.red,
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                      )),
                  Expanded(
                      child: RaisedButton.icon(
                          onPressed: () {
                            setState(() {
                              selectedButton = 2;
                              print("selected Button Setting");
                            });
                          },
                          icon: Icon(Icons.settings),
                          label: Flexible(
                              child: Text("Settings",
                                  style: new TextStyle(fontSize: TEXT_SIZE),
                                  textAlign: TextAlign.center)),
                          color: Colors.green,
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                      )
                  )
                ],
              ))
        );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("settings Page OK");
    return Scaffold(backgroundColor: Colors.green, body: Text("page settings"));
  }
}

class ActualPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Actual Position Page OK");
    return Scaffold(
        backgroundColor: Colors.red, body: Text("page Actual Position"));
  }
}

class StartPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Start Position  Page OK");
    return Scaffold(
        backgroundColor: Colors.blue, body: Text("page Start Position"));
  }
}
