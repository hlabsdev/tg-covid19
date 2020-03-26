import 'package:covid19_TG/pages/screens/doli.dart';
import 'package:covid19_TG/pages/screens/etat_modial.dart';
import 'package:covid19_TG/pages/screens/list_prev.dart';
import 'package:covid19_TG/pages/screens/list_prop.dart';
import 'package:covid19_TG/pages/screens/que_faire.dart';
import 'package:covid19_TG/pages/screens/risquy_zone.dart';
import 'package:covid19_TG/pages/screens/list_sympt.dart';
import 'package:covid19_TG/pages/widgets/information_title_card.dart';
import 'package:covid19_TG/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_screen/responsive_screen.dart';
//import 'package:';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: <Widget>[
//            SearchBar(),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new ListProp()));
                  },
                  child: InformationTitleCard(
                    icon: LineIcons.share_alt,
                    iconColor: CardColors.blue,
                    subTitle: 'Comment le Covid-19 se propage',
                    title: 'Propagation',
                  )),
              SizedBox(height: hp(3)),

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Sypmtomes()));
                },
                child: InformationTitleCard(
                  icon: LineIcons.warning,
                  iconColor: CardColors.cyan,
                  subTitle: 'Les symptomes du Covid-19',
                  title: 'Symptomes',
                ),
              ),
              SizedBox(height: hp(3)),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new Prevention()));
                },
                child: InformationTitleCard(
                  icon: LineIcons.heartbeat,
                  iconColor: CardColors.red,
                  subTitle: 'Comment prevenir le Covid-19',
                  title: 'Prevention',
                ),
              ),
              SizedBox(height: hp(3)),

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QueFaire()));
                },
                child: InformationTitleCard(
                  icon: LineIcons.question_circle,
                  iconColor: CardColors.green,
                  subTitle: 'Que fiare en cas de contamiation',
                  title: 'Que faire',
                ),
              ),

              SizedBox(height: hp(3)),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Dolli()));
                },
                child: InformationTitleCard(
                  icon: LineIcons.hand_grab_o,
                  iconColor: CardColors.green,
                  subTitle: "Une plateforme d'entraide ",
                  title: 'Doli',
                ),
              ),

              SizedBox(height: hp(3)),
              InkWell(
//                onTap: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => new RisquyZone()));
//                },
                child: InformationTitleCard(
                  icon: LineIcons.bell,
                  iconColor: CardColors.red,
                  subTitle: "Les zones a eviter imperativement !",
                  title: 'Les zones a risques',
                ),
              ),
              SizedBox(height: hp(3)),
//
              SizedBox(height: hp(3)),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Monde()));
                },
                child: InformationTitleCard(
                  icon: LineIcons.globe,
                  iconColor: CardColors.blue,
                  subTitle: "Les nombres dans le monde entier",
                  title: 'Etat mondial',
                ),
              ),
              SizedBox(height: hp(3)),
//
            ],
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
