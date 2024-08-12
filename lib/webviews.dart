import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controller;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _controller.reload();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              _controller = controller;
              print("WebView Created");
            },
            onPageStarted: (String url) {
              setState(() {
                isLoading = true;
              });
              print("Page started loading: $url");
            },
            onPageFinished: (String url) {
              setState(() {
                isLoading = false;
              });
              print("Page finished loading: $url");
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('https://www.google.com')) {
                return NavigationDecision.navigate;
              } else {
                // Prevent navigation to other sites
                return NavigationDecision.prevent;
              }
            },
          ),
          isLoading ? Center(child: CircularProgressIndicator()) : Container(),
        ],
      ),
    );
  }
}
