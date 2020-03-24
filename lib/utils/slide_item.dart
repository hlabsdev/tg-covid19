import 'package:covid_tracker/models/slide.dart';
import 'package:flutter/material.dart';
import '../models/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(slideList[index].imageUrl),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: 20,
        ),Center(
          child: Text(
            slideList[index].title,
            style: TextStyle(
                fontSize: 22,
                color: Theme
                    .of(context)
                    .primaryColor),
          ),
        ),

        Text(
          slideList[index].description,
          textAlign: TextAlign.center,
//          style: TextStyle(fontFamily: ),
        ),
      ],
    );
  }
}
