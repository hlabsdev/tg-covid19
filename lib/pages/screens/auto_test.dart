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
    /*========*/
    return Scaffold(
      body: Container(
        child: WebView(
          initialUrl:"http://covid19-check.smspro.tg/web/starter/landing",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
     floatingActionButton: FutureBuilder<WebViewController>(
       future: _controller.future,
       // ignore: missing_return
       builder: (BuildContext context,
           AsyncSnapshot<WebViewController> controller) {
         if(controller.hasData){
           return FloatingActionButton(
             child: Icon(Icons.refresh),
             onPressed: (){
             //  controller.data.loadUrl("http://192.168.1.71/covid19/chatbot-manager/web/app.php/starter/landing");
              controller.data.loadUrl("http://covid19-check.smspro.tg/web/starter/landing");
             },
           );
         }
       },
     ),
/*========*/
//      floatingActionButton: FutureBuilder<WebViewController>(
//        future: _controller.future,
//        builder: (BuildContext context,
//            AsyncSnapshot<WebViewController> controller) {
//          return Container();
//
//        },
//      ),
   );
  }

  @override
  bool get wantKeepAlive => true;
}
