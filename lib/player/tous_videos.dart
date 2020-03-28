import 'package:covid19_TG/player/videos.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class TousLesVideos extends StatefulWidget {
  @override
  _TousLesVideosState createState() => _TousLesVideosState();
}

class _TousLesVideosState extends State<TousLesVideos> {
  final List<Video> items = new List();

  Future refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      final List<Video> items = new List();
    });
    return items;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      items.add(new Video('http://linkedbyair.net/bin/city.mp4'));
      items.add(new Video('http://linkedbyair.net/bin/clauswinter.mp4'));
      items.add(new Video('https://youtu.be/HitHuhclWtg'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
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


