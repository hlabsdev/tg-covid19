
import 'package:covid19_TG/questions/ques4.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Tel extends StatefulWidget {
  Tel({Key key}) : super(key: key);
  @override
  _TelState createState() => _TelState();
}

class _TelState extends State<Tel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _showSnackBar(String t) {
    final snackBar = new SnackBar(
      content: Text(t),
      duration: Duration(seconds: 1),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  TextEditingController tc = TextEditingController();
  void addData() {
    var url = "http://192.168.1.109/dashboard/tino_folder/addtest.php";
    http.post(url, body: {"tel": tc.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 12, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        controller: tc,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Téléphone",
                          hintText: "Numéro de téléphone",
                        ),
                      ),
                    ])),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: RaisedButton(
                animationDuration: Duration(milliseconds: 3),
                color: Colors.blueAccent,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'LANCER',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                onPressed: () {
                  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                  RegExp regExp = new RegExp(pattern);
                  if (tc.text =='') {
                    _showSnackBar("Le numéro de téléphone ne peut pas etre nul");
                  } else if(!regExp.hasMatch(tc.text)){
                    _showSnackBar("Le numéro de téléphone est invalide");
                  }
                  else {
                    addData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Quest4()),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

