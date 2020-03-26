import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Monde extends StatefulWidget {
  const Monde({Key key}) : super(key: key);

  @override
  _MondeState createState() => _MondeState();
}

class _MondeState extends State<Monde>
    with AutomaticKeepAliveClientMixin {
  final Completer<WebViewController> _completer =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
          child : WebviewScaffold(
            withJavascript: true,
            mediaPlaybackRequiresUserGesture: false,
            url: "https://covidvisualizer.com",
//            appBar: new AppBar(
//              elevation: 3,
//              // title: new Text('Hairtips'),
//            ),
            withZoom: true,
            withLocalStorage: true,
          )
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _completer.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          return Container();

        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
