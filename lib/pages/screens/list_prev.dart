import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Prevention extends StatefulWidget {
  @override
  _PreventionState createState() => _PreventionState();
  int _counter = 0;
  void _incrementCounter(){
    setState((){
      _counter++;
    });
  }

  void setState(Null Function() param0) {}
}

class _PreventionState extends State<Prevention>with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prevention"),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: new Card(
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: new Column(
              children: <Widget>[
                new Image.asset("assets/images/tansmission.png")
              ],
            ),
          ),
        );
      },),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}