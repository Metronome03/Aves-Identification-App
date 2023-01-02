import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Wikipedia extends StatelessWidget {
  const Wikipedia({Key? key,required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    late WebViewController _controller;
    late String link="https://en.wikipedia.org/wiki/"+this.name.toString().toLowerCase();
    return Scaffold(
      appBar: AppBar(
        title: Text(this.name),
      ),
      body: Center(
        child: WebView(
          initialUrl: link,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController)
          {
            _controller=webViewController;
          },
        ),
      ),
    );
  }
}

