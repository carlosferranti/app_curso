import 'dart:async';
import 'package:app_curso/views/settings_view.dart';
import 'package:app_curso/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;

  const ArticleView({Key key, this.blogUrl}) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: builAppBar(context),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            initialUrl: widget.blogUrl,
            onWebViewCreated: ((WebViewController webViewController) {
              _completer.complete(webViewController);
            }),
          ),
        ));
  }
}
