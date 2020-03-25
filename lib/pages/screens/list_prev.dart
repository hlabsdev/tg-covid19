import 'package:covid19_TG/models/Guide/Guide.dart';
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
      body: ListView.builder(
        itemCount: prevList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 6.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: new Column(
                children: <Widget>[
                  new ClipRRect(
                    child: new Image.asset(prevList[index].imageUrl),
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(
                            prevList[index].title.toUpperCase(),
                            style: Theme.of(context).textTheme.subhead,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: new Text(
                                prevList[index].description,
//                                  overflow: TextOverflow.visible,
                                textAlign: TextAlign.justify,
                              ),
                            ),
//                              new Text("data"),
//                              new Text("data"),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}