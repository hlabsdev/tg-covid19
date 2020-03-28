import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  final String videos;

  final VideoPlayerController videoPlayerController;
  final bool looping;

  Videos({
    @required this.videoPlayerController,
    this.looping,
    Key key, this.videos,
  }): super(key: key);





  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
      videoPlayerController:  widget.videoPlayerController,
      aspectRatio: 16/9,
      autoInitialize: true,
      looping: widget.looping,

      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            'Erreur connexion !',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Chewie(
      controller: _chewieController,
    );
  }
  @override
  void dispose() {
    super.dispose();

    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
