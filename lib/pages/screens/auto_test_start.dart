import 'dart:async';

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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    /*========*/
    return Scaffold(
      body: Center(
          child : WebviewScaffold(
            withJavascript: true,
            mediaPlaybackRequiresUserGesture: false,
            url: "http://covid19-check.smspro.tg/web/starter/landing",
            appBar: new AppBar(
              elevation: 3,
              // title: new Text('Hairtips'),
            ),
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
