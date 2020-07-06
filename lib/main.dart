import 'package:flutter/material.dart';
import 'package:out_of_bound_ato/provider/location_provider.dart';
import 'package:out_of_bound_ato/provider/settings_provider.dart';
import 'package:out_of_bound_ato/subpage/actual_position.dart';
import 'package:out_of_bound_ato/subpage/settings.dart';
import 'package:out_of_bound_ato/subpage/starting_position.dart';
import 'package:provider/provider.dart';

const TEXT_SIZE = 9.0;
const ICON_SIZE = 12.0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        )
      ],
      child: MaterialApp(title: "Welcome to World Flutter", home: HomePage()));
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
        bottomNavigationBar: Container(
            height: 40,
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
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
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
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)))),
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
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))))
              ],
            ))
        );
  }
}
