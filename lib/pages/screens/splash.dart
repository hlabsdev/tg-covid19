import 'package:covid19_TG/models/slide.dart';
import 'package:covid19_TG/utils/slide_dots.dart';
import 'package:covid19_TG/utils/slide_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../home.dart';
import 'dart:math';
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

class Splash extends StatefulWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  @override
  _SplashState createState() => _SplashState();
  String _toTwoDigitString(int value) {
    return value.toString().padLeft(2, '0');
  }
}

class _SplashState extends State<Splash> {
  @override

  // The background
  static SendPort uiSendPort;

  // The callback for our alarm
  static Future<void> callback() async {
    print('Alarm fired!');

    // This will be null if we're running in the background.
    uiSendPort ??= IsolateNameServer.lookupPortByName(isolateName);
    uiSendPort?.send(null);
  }
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    AndroidAlarmManager.initialize();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  _onPageChange(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  _notifications() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new Home()));
    this.deactivate();
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChange,
                      itemBuilder: (ctx, i) => SlideItem(i),
                      itemCount: slideList.length,
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 35),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0;
                            i < slideList.length;
                            i++) // ignore: sdk_version_ui_as_code
                          if (i == _currentPage)
                            SlideDots(true)
                          else
                            SlideDots(false)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Pour passer apuyez >>>",
                        style: TextStyle(fontSize: 15, color: Colors.black26),
                      ),
                      FlatButton(
                        child: Text(
                          "Passer",
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          _notifications();
//                          this.dispose();
                        },
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
