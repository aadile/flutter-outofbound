import 'package:flutter/cupertino.dart';

class SettingsProvider extends ChangeNotifier {

  int _boundary = 0;
  bool _enableAlerts = false;

  void setBoundary(int boundary){
    _boundary = boundary;
    notifyListeners();
  }

  void setEnableAlert(bool enableAlerts){
    print("setEnableAlert $enableAlerts");
    _enableAlerts = enableAlerts;
    notifyListeners();
  }

  int get boundary => _boundary;

  bool get isEnableAlert => _enableAlerts;

}