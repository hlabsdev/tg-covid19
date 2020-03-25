import 'package:flutter/material.dart';

class QueFaire extends StatefulWidget {
  @override
  _QueFaireState createState() => _QueFaireState();
  int _counter = 0;
  void _incrementCounter(){
    setState((){
      _counter++;
    });
  }

  void setState(Null Function() param0) {}
}

class _QueFaireState extends State<QueFaire>with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QueFaire"),
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