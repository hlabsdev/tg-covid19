import 'package:covid19_TG/player/videos.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class TousLesVideos extends StatefulWidget {
  @override
  _TousLesVideosState createState() => _TousLesVideosState();
}

class _TousLesVideosState extends State<TousLesVideos> {
  final List<Video> items = new List();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<TousLesVideos> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      final List<Video> items = new List();
    });
    return this.widget;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      items.add(new Video('http://linkedbyair.net/bin/city.mp4'));
      items.add(new Video('http://linkedbyair.net/bin/clauswinter.mp4'));
      items.add(new Video('http://192.168.1.64:8000/uploads/videos/flutter-local-authentication-fingerprint-and-faceid-dart-packages-5e81e36c73479276197529.mp4'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
          key: refreshKey,
          onRefresh: refreshList,
          child: Center(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemExtent: 200,
                itemCount: items.length,
                itemBuilder: (context, media) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20, left: 0, right: 0),
                    child: Videos(
                      videoPlayerController: VideoPlayerController.network(
                          items[media].url),
                      looping: true,
                    ),
                  );
                }
            ),
          ),
        )
    );
  }
}

class Video {
  final String url;

  Video(this.url);
}


