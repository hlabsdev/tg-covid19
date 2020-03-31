import 'package:flutter/material.dart';


class LastPage extends StatefulWidget {
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Text('Quelques conseils', style: TextStyle(fontSize: 18),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('Risques élevés', style: TextStyle(
                fontSize: 17
            ),),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(2.5))
                        ),
                      ),
                      Text('Restez chez-vous et mettez-vous en auto-confinement'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(2.5))
                        ),
                      ),
                      Text('Portez un masque si vous avez une toux persistante'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(2.5))
                        ),
                      ),
                      Text('Appelez le 111'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(2.5))
                        ),
                      ),
                      Text('Appelez un médecin qui vous donnera plus d’indications sur vos symptômes'),
                    ],
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
