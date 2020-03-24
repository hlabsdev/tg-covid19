import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alertes extends StatefulWidget {
  @override
  _AlertesState createState() => _AlertesState();
}

class _AlertesState extends State<Alertes> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  var initialisationSettingsAndroid;
  var initialisationSettingsIOS;
  var initialisationSettings;

  void showAlerte() {}

  @override
  void initState() {
    super.initState();
    initialisationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    initialisationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    await showDialog<void>(
        context: context,
//      barrierDismissible: barrierDismissible,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) => CupertinoAlertDialog(
              title: Text("Titre"),
              content: Text("Contenu"),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("Ok"),
                  onPressed: () async{
                    Navigator.of(context, rootNavigator: true).pop(
                      await Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>SecondRoute())
                      )
                    );
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();  }
}
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertepage'),
      ),
      
    );
  }
}

