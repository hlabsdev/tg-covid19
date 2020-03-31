import 'dart:async';

import 'package:covid19_TG/home.dart';
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
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    /*========*/
    return WebviewScaffold(
        withJavascript: false,
        mediaPlaybackRequiresUserGesture: false,
        url: "https://dolli-app.com",
        withZoom: true,
        withLocalStorage: false,
        hidden: false,
        appCacheEnabled: false,
        primary: false,
    );
  }

  @override
  bool get wantKeepAlive => false;

}
