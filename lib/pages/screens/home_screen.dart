import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:covid19_TG/blocs/blocs.dart';
import 'package:covid19_TG/pages/screens/auto_test.dart';
import 'package:covid19_TG/pages/screens/auto_test_start.dart';
import 'package:covid19_TG/pages/screens/covid_gouv.dart';
import 'package:covid19_TG/pages/screens/dolli.dart';
import 'package:covid19_TG/questions/first_page.dart';
import 'package:covid19_TG/questions/genre.dart';
import 'package:covid19_TG/utils/margin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_screen/responsive_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {

  List data1;

  Future<String> makeRequest() async {
    String url = "https://thevirustracker.com/free-api?countryTotal=TG";

    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      var extractContrydata = json.decode(response.body);
      data1 = extractContrydata["countrydata"];
    });
  }

  Future<String> refreshList() {
    setState(() {
      this.makeRequest();
    });
//    return null;
  }

  @override
  void initState() {
    super.initState();
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Function hp = Screen(context).hp;
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      return WillPopScope(
        onWillPop: _onBackPressed,
        child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30),
            child: BlocBuilder<CaseBloc, CaseState>(
              builder: (BuildContext context, CaseState state) {
                return Column(
                  children: <Widget>[
                    Container(
                      width: screenWidth(context),
                      height: screenHeight(context, percent: 0.2),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.18),
                              blurRadius: 10,
                              spreadRadius: 3.5,
                              offset: Offset(0, 10)),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AutoTest()));
                          //ouvreNavigateur("http://covid19-check.smspro.tg/web/starter/landing");
                        },
                        child: Center(
                          child: ListTile(
                            title: Text(
                              "Faites votre Auto-Evaluation",
                              style: TextStyle(color: Colors.white),
                            ),
                            leading: Icon(
                              Icons.local_hospital,
                              color: Colors.blue,
                              size: 50.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: hp(3)),
                    Container(
                      width: screenWidth(context),
                      height: screenHeight(context, percent: 0.2),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.18),
                              blurRadius: 10,
                              spreadRadius: 3.5,
                              offset: Offset(0, 10)),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new Dolli()));
                          //ouvreNavigateur("http://covid19-check.smspro.tg/web/starter/landing");
                        },
                        child: Center(
                          child: ListTile(
                            title: Text(
                              "Dolli Une plateforme de partage de bien",
                              style: TextStyle(color: Colors.white),
//                              textAlign: TextAlign.justify,
                            ),
                            leading: Icon(
                              Icons.group,
                              color: Colors.greenAccent,
                              size: 50.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: hp(3)),
                    Container(
                      width: screenWidth(context),
                      height: screenHeight(context, percent: 0.2),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.18),
                              blurRadius: 10,
                              spreadRadius: 3.5,
                              offset: Offset(0, 10)),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CovidGouv()));
                          //ouvreNavigateur("http://covid19-check.smspro.tg/web/starter/landing");
                        },
                        child: Center(
                          child: ListTile(
                            title: Text(
                              "La plateforme officielle du covid19",
                              style: TextStyle(color: Colors.white),
//                              textAlign: TextAlign.center,
                            ),
                            leading: Icon(
                              Icons.info_outline,
                              color: Colors.redAccent,
                              size: 50.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: hp(3)),
                  ],
                );
              },
            )),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Voulez vous vraiment quitter?"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Non'),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text('Oui'),
//            onPressed: () => Navigator.pop(context, true),
                  onPressed: () => exit(0),
                ),
              ],
            ));
  }
}
