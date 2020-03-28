import 'dart:async';

import 'package:covid19_TG/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AutoTest extends StatefulWidget {
  const AutoTest({Key key}) : super(key: key);

  @override
  _AutoTestState createState() => _AutoTestState();
}

class _AutoTestState extends State<AutoTest>
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
        url: "https://covid19-check.smspro.tg/web/starter/landing",
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
