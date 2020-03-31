import 'dart:async';
import 'dart:io';

import 'package:covid19_TG/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AutoTest1 extends StatefulWidget {
  const AutoTest1({Key key}) : super(key: key);

  @override
  _AutoTestState createState() => _AutoTestState();
}

class _AutoTestState extends State<AutoTest1>
    with AutomaticKeepAliveClientMixin {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  num _stackToView = 1;
  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }


  void _return(){
    this.deactivate();
    this.dispose();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Voulez vous vraiment quitter?"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Non'),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text('Oui'),
//            onPressed: () => Navigator.pop(context, true),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => null;
    /*========*//*
    *//*return WebView(
      initialUrl: "https://covid19-check.smspro.tg/web/starter/landing",
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: _handleLoad,
      onWebViewCreated: (WebViewController webController){
        _completer.complete(webController);
      },
    );
    floatingActionButton: NavigationControls(_completer.future);*//*

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: WebviewScaffold(
        enableAppScheme: true,
        clearCache: true,
        clearCookies: true,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () {
            Navigator.pop(context);
          },),
        ),
        withJavascript: false,
        mediaPlaybackRequiresUserGesture: false,
        url: "https://covid19-check.smspro.tg/web/starter/landing",
        withZoom: true,
        withLocalStorage: false,
        hidden: false,
        appCacheEnabled: false,
        primary: false,
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return FloatingActionButton.extended(
          onPressed: !webViewReady
              ? null
              : () => navigate(context, controller, goBack: true),
          icon: Icon(Icons.arrow_back),
          backgroundColor: Colors.black,
          label: Text("Voltar"),
        );
      },
    );
  }

  navigate(BuildContext context, WebViewController controller,
      {bool goBack: false}) async {
    bool canNavigate =
    goBack ? await controller.canGoBack() : await controller.canGoForward();
    if (canNavigate) {
      goBack ? controller.goBack() : controller.goForward();
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
            content: Text("Sem histórico anterior")),
      );
    }
  }*/
}