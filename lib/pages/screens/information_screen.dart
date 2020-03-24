import 'package:covid_tracker/pages/widgets/information_title_card.dart';
import 'package:covid_tracker/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_screen/responsive_screen.dart';
//import 'package:';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> with AutomaticKeepAliveClientMixin {
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
            InformationTitleCard(icon: LineIcons.share_alt, iconColor: CardColors.blue, subTitle: 'Comment le Covid-19 se propage', title: 'Propagation',),
            SizedBox(height: hp(3)),
            InformationTitleCard(icon: LineIcons.warning, iconColor: CardColors.cyan, subTitle: 'Les symptomes du Covid-19', title: 'Symptomes',),
            SizedBox(height: hp(3)),
            InformationTitleCard(icon: LineIcons.heartbeat, iconColor: CardColors.red, subTitle: 'Comment prevenir le Covid-19', title: 'Prevention',),
            SizedBox(height: hp(3)),
            InformationTitleCard(icon: LineIcons.question_circle, iconColor:CardColors.green, subTitle: 'Que fiare en cas de contamiation', title: 'Que faire',),
          ],
        )
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}