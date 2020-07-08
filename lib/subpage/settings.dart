import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:out_of_bound_ato/provider/settings_provider.dart';
import 'package:out_of_bound_ato/service/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SettingsPage extends StatelessWidget {
  NotificationService _notificationService;

  @override
  Widget build(BuildContext context) {
    print("settings Page OK");
    _notificationService = new NotificationService();

    return Consumer<SettingsProvider>(builder: (context, _settingsProvider, _) {
      return Scaffold(
        backgroundColor: Colors.green,
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 35.0, bottom: 15.0),
                  child: Text('Page Settings: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter a boundary in meters'),
                  onChanged: (text) {
                    print("changed text ${text}");
                    _settingsProvider.setBoundary(int.parse(text));
                  },
                  controller: TextEditingController()..text = _settingsProvider.boundary.toString(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0, bottom: 15.0),
                  child: Text('With alerts: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 20,
                    activeBgColor: Colors.green,
                    activeTextColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveTextColor: Colors.white,
                    labels: ['YES', 'NO'],
                    icons: [Icons.check, Icons.close],
                    activeColors: [Colors.lightGreen, Colors.red],
                    initialLabelIndex:
                        (_settingsProvider.isEnableAlert ? 0 : 1),
                    onToggle: (index) {
                      if (index == 0) {
                        _settingsProvider.setEnableAlert(true);
                        _notificationService.showNotificationEnableAlert();
                      } else {
                        _settingsProvider.setEnableAlert(false);
                        _notificationService.cancelNotificationEnableAlert();
                      }
                    }),
              ],
            )),
      );
    });
  }
}
