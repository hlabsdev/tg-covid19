import 'dart:async';

import 'package:covid19_TG/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CovidGouv extends StatefulWidget {
  const CovidGouv({Key key}) : super(key: key);

  @override
  _CovidGouvState createState() => _CovidGouvState();
}

class _CovidGouvState extends State<CovidGouv>
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
        url: "https://covid19.gouv.tg/",
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
