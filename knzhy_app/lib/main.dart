import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:zoom_widget/zoom_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';
import 'dart:async';


void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  runApp(MyApp());}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:  Scaffold(
          body:
          SafeArea(
            child: WebViewLoad(),
          ),
        )

    );
  }
}

class WebViewLoad extends StatefulWidget {

  WebViewLoadUI createState() => WebViewLoadUI();

}



class WebViewLoadUI extends State<WebViewLoad>{


  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();


  @override
  void initState() {
    super.initState();


    flutterWebviewPlugin.close();


  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        SystemNavigator.pop();
        return flutterWebviewPlugin.close();
      },
      child: Scaffold(
        body:
        SafeArea(
          child: WebviewScaffold(
            url: 'https://kanzulhaya.com/',
            withZoom: true,
            withJavascript: true,
            withLocalStorage: true,
            withLocalUrl: true,
            clearCookies: false,
            clearCache: false,
            scrollBar: true,
            appCacheEnabled: true,



          ),
        ),


      ),
    );


  }
}
