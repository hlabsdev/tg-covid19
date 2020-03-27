import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      child: Center(
          child: WebviewScaffold(
        withJavascript: true,
        mediaPlaybackRequiresUserGesture: false,
        url: "http://covid19-check.smspro.tg/web/starter/landing",
//        withZoom: true,
        withLocalStorage: true,
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
