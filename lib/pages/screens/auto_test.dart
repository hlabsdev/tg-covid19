import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AutoTest extends StatefulWidget {
  @override
  _AutoTestState createState() => _AutoTestState();
}

class _AutoTestState extends State<AutoTest> {
  /* define webview controller */
  WebViewController _controller;
/* before we leave current route, make sure to change the url to something */
  Future<bool> _willPopCallback(WebViewController controller) async {
    controller.loadUrl('https://covid19-check.smspro.tg/web/starter/landing'); /* or you can use controller.reload() to just reload the page */
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _willPopCallback(_controller),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: WebView(
                key: UniqueKey(),
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: "https://covid19-check.smspro.tg/web/starter/landing",
                onWebViewCreated: (WebViewController webViewController){
                  _controller = webViewController;
                },
              ),
            ),
            Text("Pause en quittant")
          ],
        ),
      ),
    );
  }
}
