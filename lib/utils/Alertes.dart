import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alertes extends StatefulWidget {
  @override
  _AlertesState createState() => _AlertesState();
}

class _AlertesState extends State<Alertes> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  var initialisationSettingsAndroid;
  var initialisationSettingsIOS;
  var initialisationSettings;
  void showAlerte(){

  }

  @override
  void initState() {
    super.initState();
    initialisationSettingsAndroid = new AndroidInitializationSettings('app_icon');
    initialisationSettingsAndroid = new AndroidInitializationSettings('app_icon');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
