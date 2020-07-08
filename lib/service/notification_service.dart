import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static const ENABLE_NOTIFICATION_ID = 0;
  static const OUT_OF_BOUNDS_NOTIFICATION_ID = 1;
  static const BACK_IN_BOUNDS_NOTIFICATION_ID = 2;

  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> showNotificationOutOfBounds(double metersOut) async {
    NotificationDetails platformChannelSpecifics =
        createPlatformChannelSpecifics(true);
    await _flutterLocalNotificationsPlugin.show(
        OUT_OF_BOUNDS_NOTIFICATION_ID,
        'Out of bounds',
        'Alert ! You are $metersOut meter too far from your starting point',
        platformChannelSpecifics,
        payload: 'item x');
  }

  Future<void> showNotificationBackInBounds() async {
    NotificationDetails platformChannelSpecifics =
        createPlatformChannelSpecifics(true);
    await _flutterLocalNotificationsPlugin.show(BACK_IN_BOUNDS_NOTIFICATION_ID,
        'Out of bounds', 'Ok, all is all right now !', platformChannelSpecifics,
        payload: 'item x');
  }

  Future<void> showNotificationEnableAlert() async {
    NotificationDetails platformChannelSpecifics =
        createPlatformChannelSpecifics(false);
    await _flutterLocalNotificationsPlugin.show(ENABLE_NOTIFICATION_ID,
        'Out of bounds', 'Alerts enabled !', platformChannelSpecifics,
        payload: 'item x');
  }

  NotificationDetails createPlatformChannelSpecifics(bool enableCancel) {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max,
        priority: Priority.High,
        ticker: 'ticker',
        ongoing: !enableCancel,
        autoCancel: enableCancel);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    return platformChannelSpecifics;
  }

  Future<void> _cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelNotificationEnableAlert() async {
    await _cancelNotification(ENABLE_NOTIFICATION_ID);
  }
}
