import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => LocationProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SettingsProvider(),
      )
    ], child: MaterialApp(title: "Welcome to World Flutter", home: HomePage()));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedButton = 0;
  final choiceButton = [StartPosition(), ActualPosition(), SettingsPage()];

  Alignment _alignment = Alignment.bottomLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hello World")),
        body: choiceButton[selectedButton],
        bottomNavigationBar: Container(
            height: 40,
            alignment: Alignment.bottomCenter,
            child: Stack(children: <Widget>[
              AnimatedAlign(
                duration: Duration(milliseconds: 500),
                alignment: _alignment,
                child: Container(
                  width: 135,
                  //height: kBottomNavigationBarHeight,
                  padding: EdgeInsets.all(1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() {
                          selectedButton = 0;
                          _alignment = Alignment.bottomLeft;
                          print("selected Button Starting Location");
                        });
                      },
                      icon: Icon(Icons.location_city,
                          color:
                              selectedButton == 0 ? Colors.white : Colors.grey),
                      label: Flexible(
                          child: Text("Starting location",
                              style: new TextStyle(
                                  fontSize: TEXT_SIZE,
                                  color: selectedButton == 0
                                      ? Colors.white
                                      : Colors.grey),
                              textAlign: TextAlign.center)),
                      //color: Colors.blue,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ),
                Expanded(
                    child: FlatButton.icon(
                        onPressed: () {
                          setState(() {
                            selectedButton = 1;
                            _alignment = Alignment.bottomCenter;
                            print("selected Button Actual Location");
                          });
                        },
                        icon: Icon(Icons.my_location,
                            color: selectedButton == 1
                                ? Colors.white
                                : Colors.grey),
                        label: Flexible(
                            child: Text("Actual Position",
                                style: new TextStyle(
                                    fontSize: TEXT_SIZE,
                                    color: selectedButton == 1
                                        ? Colors.white
                                        : Colors.grey),
                                textAlign: TextAlign.center)),
                        //color: Colors.red,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)))),
                Expanded(
                    child: FlatButton.icon(
                        onPressed: () {
                          setState(() {
                            selectedButton = 2;
                            _alignment = Alignment.bottomRight;
                            print("selected Button Setting");
                          });
                        },
                        icon: Icon(Icons.settings,
                            color: selectedButton == 2
                                ? Colors.white
                                : Colors.grey),
                        label: Flexible(
                            child: Text("Settings",
                                style: new TextStyle(
                                    fontSize: TEXT_SIZE,
                                    color: selectedButton == 2
                                        ? Colors.white
                                        : Colors.grey),
                                textAlign: TextAlign.center)),
                        //color: Colors.green,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))))
              ])
            ])));
  }
}
