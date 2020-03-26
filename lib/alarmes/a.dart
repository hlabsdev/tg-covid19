import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scheduled_notifications/scheduled_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:isolate';
import 'dart:ui';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// The [SharedPreferences] key to access the alarm fire count.
const String countKey = 'count';

/// The name associated with the UI isolate's [SendPort].
const String isolateName = 'isolate';

/// A port used to communicate from a background isolate to the UI isolate.
final ReceivePort port = ReceivePort();

/// Global [SharedPreferences] object.
SharedPreferences prefs;

Future<void> main() async {
  // TODO(bkonyi): uncomment
  WidgetsFlutterBinding.ensureInitialized();

  IsolateNameServer.registerPortWithName(
    port.sendPort,
    isolateName,
  );
  prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey(countKey)) {
    await prefs.setInt(countKey, 0);
  }
}

class MyHomePage extends StatefulWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  @override
  _MyHomePageState createState() => new _MyHomePageState();

  String _toTwoDigitString(int value) {
    return value.toString().padLeft(2, '0');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    AndroidAlarmManager.initialize();

  }

  // The background
  static SendPort uiSendPort;

  // The callback for our alarm
  static Future<void> callback() async {
    print('Alarm fired!');

    // This will be null if we're running in the background.
    uiSendPort ??= IsolateNameServer.lookupPortByName(isolateName);
    uiSendPort?.send(null);
  }

  _notifications() async {
    await AndroidAlarmManager.oneShot(
      const Duration(seconds: 5),
      // Ensure we have a unique alarm ID.
      Random().nextInt(pow(2, 31)),
      callback,
      exact: true,
      wakeup: true,
    );
    int notificationId1 = await ScheduledNotifications.scheduleNotification(
        new DateTime.now().add(new Duration(minutes: 1)).millisecondsSinceEpoch,
        "",
        "Tous contre Covid19",
        "Ensemble luttons contre la propagation du Covid19 au Togo. "
    );
    int notificationId2 = await ScheduledNotifications.scheduleNotification(
        new DateTime.now().add(new Duration(hours: 5)).millisecondsSinceEpoch,
        "",
        "Tous contre Covid19",
        "Ensemble luttons contre la propagation du Covid19 au Togo. "
    );
    int notificationId3 = await ScheduledNotifications.scheduleNotification(
        new DateTime.now().add(new Duration(hours: 13)).millisecondsSinceEpoch,
        "",
        "Tous contre Covid19",
        "Ensemble luttons contre la propagation du Covid19 au Togo. "
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Gestion des alarmes'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: RaisedButton(
                child: Text(
                  'Schedule OneShot Alarm',
                ),
                key: ValueKey('RegisterOneShotAlarm'),
                onPressed: () {
                  _notifications();
                }
              ),
            ),
          ],
        )
    );
  }
}