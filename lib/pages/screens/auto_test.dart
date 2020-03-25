import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  final Completer<WebViewController> _completer =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        child: WebView(
          initialUrl:"http://covid19-check.smspro.tg/web/starter/landing",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _completer.complete(webViewController);
          },
        ),
      ),
     floatingActionButton: FutureBuilder<WebViewController>(
       future: _completer.future,
       builder: (BuildContext context, AsyncSnapshot<WebViewController>
       coontroller){
         if (coontroller.hashCode){
           child: FloatingActionButton(
             child: Icon(Icons.refresh),
             onPressed: (){
               controller.data.loadUrl("http://covid19-check.smspro.tg/web/starter/landing")
             },
           ),
         }
       },
     ),
     /* floatingActionButton: FutureBuilder<WebViewController>(
        future: _completer.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          return Container();

        },
      ),*/
    );
  }

  @override
  bool get wantKeepAlive => true;
}
