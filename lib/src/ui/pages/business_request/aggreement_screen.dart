import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/utils/loading_widget.dart/loading_widget.dart';
import 'package:vibrate/vibrate.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AggreementScreen extends StatefulWidget {
  final String type;
  static const String routeName = "AggreementScreen";
  AggreementScreen({Key key, this.type}) : super(key: key);

  @override
  _AggreementScreenState createState() => _AggreementScreenState();
}

class _AggreementScreenState extends State<AggreementScreen> {

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(microseconds: 100), () {
      LoadingWidget.startLoadingWidget(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorsHelper.whiteColor(),
        child: SafeArea(
            left: false,
            right: false,
            top: false,
            bottom: true,
            child: Scaffold(
              //App bar
                appBar: AppBar(
                  backgroundColor: ColorsHelper.whiteColor(),
                  elevation: 3,
                  leading: IconButton(
                    onPressed: () {
                      Vibrate.feedback(FeedbackType.light);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.clear,
                        size: 30, color: ColorsHelper.themeBlackColor()),
                  ),
                  centerTitle: true,
                  title: Container(
                    //  margin: const EdgeInsets.only(top: 45, bottom: 15),
                    width: MediaQuery.of(context).size.height *
                        (Platform.isIOS ? 0.15 : 0.12),
                    height: MediaQuery.of(context).size.height *
                        (Platform.isIOS ? 0.10 : 0.15),
                    child: FlareActor(
                      'assets/logo_chactor.flr',
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: "Logo",
                      //controller: controls,
                    ),
                  ),
                ),
                backgroundColor: ColorsHelper.whiteColor(),
                //body
                body: Builder(builder: (BuildContext context) {
                  return WebView(
                    initialUrl: 'https://www.google.co.in/',
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                    // TODO(iskakaushik): Remove this when collection literals makes it to stable.
                    // ignore: prefer_collection_literals
                    javascriptChannels: <JavascriptChannel>[
                      _toasterJavascriptChannel(context),
                    ].toSet(),
                    navigationDelegate: (NavigationRequest request) {
                      if (request.url.startsWith('https://www.youtube.com/')) {
                        print('blocking navigation to $request}');
                        return NavigationDecision.prevent;
                      }
                      print('allowing navigation to $request');
                      return NavigationDecision.navigate;
                    },
                    onPageStarted: (String url) {
                      //LoadingWidget.startLoadingWidget(context);
                      print('Page started loading: $url');
                    },
                    onPageFinished: (String url) {

                      LoadingWidget.endLoadingWidget(context);
                      print('Page finished loading: $url');
                    },
                    //gestureNavigationEnabled: true,
                  );
                }),
            )
        )
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

}
