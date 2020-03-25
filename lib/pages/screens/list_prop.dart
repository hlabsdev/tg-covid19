import 'dart:async';

import 'package:covid19_TG/models/Guide/Guide.dart';
import 'package:covid19_TG/pages/widgets/list_propag.dart';
import 'package:flutter/material.dart';

class ListProp extends StatefulWidget {
  @override
  _ListPropState createState() => _ListPropState();
}

class _ListPropState extends State<ListProp>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Propagation"),
        ),
        body: ListView.builder(
          itemCount: propagationList.length,
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
                      child: new Image.asset(propagationList[index].imageUrl),
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
                          Text(
                            propagationList[index].title.toUpperCase(),
                            style: Theme.of(context).textTheme.subhead,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
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
                                  propagationList[index].description,
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
