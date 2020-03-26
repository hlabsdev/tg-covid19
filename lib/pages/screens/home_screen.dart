import 'dart:async';
import 'dart:convert';
import 'package:covid19_TG/blocs/blocs.dart';
import 'package:covid19_TG/pages/screens/auto_test_start.dart';
import 'package:covid19_TG/pages/widgets/global_card.dart';
import 'package:covid19_TG/theme/color/light_color.dart';
import 'package:covid19_TG/utils/calculateGrowth.dart';
import 'package:covid19_TG/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_screen/responsive_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  Completer<void> _refreshCompleter;
  String url = "https://thevirustracker.com/free-api?countryTotal=TG";
  List data1;
  List data2;

  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractContrydata = json.decode(response.body);
      var extractContryNewdata = json.decode(response.body);
      data1 = extractContrydata["countrydata"];
      data2 = extractContryNewdata["countrynewsitems"];
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    this.makeRequest();
  }

  @override
  void didChangeDependencies() {
    BlocProvider.of<CaseBloc>(context).add(FetchCase());

    //do whatever you want with the bloc here.
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: BlocBuilder<CaseBloc, CaseState>(
          builder: (BuildContext context, CaseState state) {
            print(state);
            if (state is CaseLoading) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  YMargin(hp(29)),
                  Center(
                      child: SpinKitSquareCircle(
                    color: CardColors.green,
                    size: 50.0,
                  )),
                ],
              );
            }
            if (state is CaseLoaded) {
              final currentData = state.currentData;
              final firstData = state.firstData;
              return RefreshIndicator(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: screenWidth(context),
                      height: screenHeight(context, percent: 0.1),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.orange,
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
                                  builder: (context) => new AutoTest()));
                        },
                        child: Center(
                          child: ListTile(
                            title: Text("Faites votre Auto-Test", style: TextStyle(color: Colors.white),),
                            leading: Icon(
                              Icons.thumbs_up_down,
                              color: Colors.red,
                              size: 50.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: hp(3)),
                    GlobalSituationCard(
                      cardTitle: 'Cas Confirmés',
                      caseTitle: 'Confirmés',
                      currentData: data1[0]["total_cases"],
                      newData: data1[0]["total_new_cases_today"],
                      icon: showGrowthIcon(data1[0]["total_cases"],
                          data1[0]["total_new_cases_today"]),
                      color: Colors.red,
                    ),
                    SizedBox(height: hp(3)),
                    GlobalSituationCard(
                      cardTitle: 'Cas Gueris',
                      caseTitle: 'Gueris',
                      currentData: data1[0]["total_recovered"],
                      newData: null,
                      cardColor: CardColors.blue,
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                      ),
                      color: Colors.green,
                    ),
                    SizedBox(height: hp(3)),
                    GlobalSituationCard(
                      cardTitle: 'Cas de Decès',
                      caseTitle: 'Decès',
                      currentData: data1[0]["total_deaths"],
                      newData: data1[0]["total_new_deaths_today"],
                      icon: showGrowthIcon(data1[0]["total_deaths"],
                          data1[0]["total_new_deaths_today"]),
                      color: Colors.red,
                      cardColor: CardColors.red,
                    ),
                    SizedBox(height: hp(3)),
                    GlobalSituationCard(
                      cardTitle: 'Cas Actif',
                      caseTitle: 'Graves',
                      currentData: data1[0]["total_active_cases"],
                      newData: null,
                      icon: showGrowthIcon(data1[0]["total_active_cases"],
                          data1[0]["total_new_cases_today"]),
                      color: Colors.red,
                      cardColor: CardColors.cyan,
                    ),
                    SizedBox(height: hp(3)),
                  ],
                ),
                onRefresh: () {
                  BlocProvider.of<CaseBloc>(context).add(FetchCase());
                  return _refreshCompleter.future;
                },
              );
            }
            if (state is CaseError) {
              return Text(
                'Veullez verifier votre connexion internet!',
                style:
                    GoogleFonts.cabin(textStyle: TextStyle(color: Colors.red)),
              );
            }
            return Center(
                child: RefreshIndicator(
              child: Text('Tirez pour rafraichir'),
              onRefresh: () {
                BlocProvider.of<CaseBloc>(context).add(FetchCase());
                return _refreshCompleter.future;
              },
            ));
          },
          // listener: (BuildContext context, CaseState state) {
          //   if (state is CaseLoaded) {
          //     BlocProvider.of<CaseBloc>(context).add(FetchCase());
          //   }
          // }
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
