import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.39),
            Align(
              alignment: Alignment.center,
              child: Card(
                elevation: 10,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Sélectionnez votre langue', style: TextStyle(
                      fontSize: 14
                  ),),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  child: Text('FRANCAIS', style: TextStyle(
                    color: Colors.white
                  )),
                  onPressed: () {
                  },
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('EWE', style: TextStyle(
                      color: Colors.white
                  )),
                  onPressed: () {

                  },
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('KABYE', style: TextStyle(
                      color: Colors.white
                  )),
                  onPressed: () {

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
