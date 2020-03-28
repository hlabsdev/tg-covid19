import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class VideoStreamer extends StatefulWidget {
  @override
  _VideoStreamerState createState() => _VideoStreamerState();
}

class _VideoStreamerState extends State<VideoStreamer> {
  /*Données web*/
  String url = "https://thevirustracker.com/free-api?countryTotal=TG";
  List data1;

  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractContrydata = json.decode(response.body);
      var extractContryNewdata = json.decode(response.body);
      data1 = extractContrydata["countrydata"];
    });
  }
  /*Données web*/
  VideoPlayerController _videoPlayerController;

  void _initPlayer() {
    _videoPlayerController = VideoPlayerController.network(
        "http://linkedbyair.net/bin/city.mp4");
    _videoPlayerController.initialize();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _playerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _videoPlayerController.value.isPlaying? _videoPlayerController.pause() : _videoPlayerController.play();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  Widget _playerWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: VideoPlayer(_videoPlayerController),
        )
      ],
    );
  }
}
