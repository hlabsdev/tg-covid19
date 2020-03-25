import 'package:flutter/material.dart';

class ListPropag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 6.0,
      shape:
          new RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: new Column(
        children: <Widget>[
          new ClipRRect(
            child: new Image.asset("assets/images/tansmission.png"),
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
                  "Par contact manuel".toUpperCase(),
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
                        "On peut etre contaminé en serrant les mains, en se touchant physiquement",
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
    );

   /*return Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
     child: Column(
       children: <Widget>[
         Container(
           child: ExpansionTile(
             title: Text('Propagation', style: TextStyle(color: Colors.blue, fontSize: 19)),
             leading: Image.asset('assets/icons/image164.png'),
             children: <Widget>[
               Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                 child: Column(
                   children: <Widget>[
                     Center(
                       child: Container(
                         height: 100,
                         width: MediaQuery.of(context).size.width,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: AssetImage("assets/images/tansmission.png"),
                                 fit: BoxFit.cover
                             )
                         ),
                       ),
                     ),
                     SizedBox(height: 12,),
                     Center(
                       child: Text( "On peut etre contaminé en serrant les mains, en se touchant physiquement",
                         style: TextStyle(
                             fontFamily: 'Open Sans',
                             fontSize: 15
                         ),
                       ),
                     ),
                   ],
                 ),
               )
             ],
           ),
         )
       ],
     ),
   );*/
  }
}
