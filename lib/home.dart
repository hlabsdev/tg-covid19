import 'package:covid19_TG/pages/screens/home_screen.dart';
import 'package:covid19_TG/theme/color/light_color.dart';
import 'package:covid19_TG/theme/theme.dart';
import 'package:covid19_TG/utils/Alertes.dart';
import 'package:covid19_TG/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'blocs/blocs.dart';
import 'pages/screens/guide.dart';
import 'pages/screens/nouvelles.dart';
import 'pages/screens/auto_test.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  void addPostFrameCallback(FrameCallback callback) {
    // Load data on widget load
    print('relad?');
    BlocProvider.of<CaseBloc>(context).add(FetchCase());
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomeScreen(),
        NewsPage(),
        InformationScreen(),
        SettingsPage(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//            en tete
            new UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: null,
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.blueGrey,

              ),
            ),
            // corps

            InkWell(
              onTap: () async {
                /*Navigator.of(context, rootNavigator: true).pop(
                      await Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Alertes())
                      )
                    );*/
              },
              child: ListTile(
                title: Text("Gerer les alarmes"),
                leading: Icon(
                  Icons.alarm_on,
                  color: Colors.red,
                ),
              ),
            ),
//
//            InkWell(
//              onTap: () {},
//              child: ListTile(
//                title: Text("Mon Compte"),
//                leading: Icon(
//                  Icons.person,
//                  color: Colors.red,
//                ),
//              ),
//            ),
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                const YMargin(60),
                Text(
                  'Covid-19 TG',
                  style: GoogleFonts.cabin(
                    textStyle:
                        TextStyle(fontSize: 21, color: Color(0xff989CAC)),
                  ),
                ),
              ],
            ),
          ),
          const YMargin(10),
          Expanded(child: buildPageView()),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                .add(EdgeInsets.symmetric(top: 15)),
            child: GNav(
                gap: 10,
                activeColor: Colors.white,
                color: Colors.grey[400],
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Acceuil',
                    backgroundColor: CardColors.red,
                  ),
                  GButton(
                    icon: LineIcons.newspaper_o,
                    text: 'Medias',
                    backgroundColor: CardColors.cyan,
                  ),
                  GButton(
                    icon: LineIcons.list_ul,
                    text: 'Guides',
                    backgroundColor: CardColors.blue,
                  ),
                  GButton(
                    icon: LineIcons.medkit,
                    text: 'Test',
                    backgroundColor: CardColors.green,
//                    active: true,
                  ),
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    pageController.jumpToPage(index);
                  });
                }),
          ),
        ),
      ),
    );
  }
}
