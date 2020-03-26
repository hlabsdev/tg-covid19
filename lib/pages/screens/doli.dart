import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Dolli extends StatefulWidget {
  const Dolli({Key key}) : super(key: key);

  @override
  _DolliState createState() => _DolliState();
}

class _DolliState extends State<Dolli>
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
            url: "https://dolli-app.com",
//            appBar: AppBar(
//              backgroundColor: Colors.transparent,
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
