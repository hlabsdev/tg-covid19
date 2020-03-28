import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:covid19_TG/utils/margin.dart';
import 'component/asset_audio_player_icons.dart';
import 'package:flutter/material.dart';

class AudioPrevention extends StatefulWidget {
  @override
  _AudioPreventionState createState() => _AudioPreventionState();
}

class _AudioPreventionState extends State<AudioPrevention> {
  final assets = <String>[
    "assets/audios/Mesures_de_prevention_du_Corona_virus1.mp3",
    "assets/audios/Mesures_de_prevention_du_Corona_virus2.mp3",
    "assets/audios/Mesures_de_prevention_du_Corona_virus3.mp3",
    "assets/audios/Mesures_de_prevention_du_Corona_virus4.mp3",
  ];
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  var _currentAssetPosition = -1;

  void _open(int assetIndex) {
    _currentAssetPosition = assetIndex % assets.length;
    _assetsAudioPlayer.open(assets[_currentAssetPosition]);
  }

  void _playPause() {
    _assetsAudioPlayer.playOrPause();
  }

  void _next() {
    if (_assetsAudioPlayer.playlist != null) {
      _assetsAudioPlayer.playlistNext();
    } else {
      _currentAssetPosition++;
      _open(_currentAssetPosition);
    }
  }

  void _prev() {
    if (_assetsAudioPlayer.playlist != null) {
      _assetsAudioPlayer.playlistPrevious();
    } else {
      _currentAssetPosition--;
      _open(_currentAssetPosition);
    }
  }

  @override
  void dispose() {
    _assetsAudioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
                child: Align(
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('Audios en langues locales'),
                    ),
                  ),
                ),
                onTap: () {
                  _assetsAudioPlayer
                      .openPlaylist(Playlist(assetAudioPaths: this.assets));
                }),
            Expanded(
              child: StreamBuilder(
                stream: _assetsAudioPlayer.current,
                initialData: const PlayingAudio(),
                builder: (BuildContext context,
                    AsyncSnapshot<PlayingAudio> snapshot) {
                  final PlayingAudio currentAudio = snapshot.data;
                  return ListView.builder(
                    itemBuilder: (context, position) {
                      return Container(
                        width: screenWidth(context),
                        height: screenHeight(context, percent: 0.1),
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.18),
                                blurRadius: 10,
                                spreadRadius: 1.5,
                                offset: Offset(0, 5)),
                          ],
                        ),
                        child: Center(
                          child: ListTile(
                            title: Center(
                              child: Text(
                                  assets[position]
                                      .split(
                                          "assets/audios/Mesures_de_prevention_du_")
                                      .last,
                                  style: TextStyle(
                                      color: assets[position] ==
                                              currentAudio.assetAudioPath
                                          ? Colors.blue
                                          : Colors.black)),
                            ),
                            onTap: () {
                              _open(position);
                            },
                          ),
                        ),
                      );
                    },
                    itemCount: assets.length,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder(
                  stream: _assetsAudioPlayer.currentPosition,
                  initialData: const Duration(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Duration> snapshot) {
                    Duration duration = snapshot.data;
                    return Text(durationToString(duration));
                  },
                ),
                Text(" - "),
                StreamBuilder(
                  stream: _assetsAudioPlayer.current,
                  builder: (BuildContext context,
                      AsyncSnapshot<PlayingAudio> snapshot) {
                    Duration duration = Duration();
                    if (snapshot.hasData) {
                      duration = snapshot.data.duration;
                    }
                    return Text(durationToString(duration));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: _prev,
                  icon: Icon(AssetAudioPlayerIcons.to_start),
                ),
                StreamBuilder(
                  stream: _assetsAudioPlayer.isPlaying,
                  initialData: false,
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return IconButton(
                      onPressed: _playPause,
                      icon: Icon(snapshot.data
                          ? AssetAudioPlayerIcons.pause
                          : AssetAudioPlayerIcons.play),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(AssetAudioPlayerIcons.to_end),
                  onPressed: _next,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String durationToString(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
  String twoDigitSeconds =
      twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
