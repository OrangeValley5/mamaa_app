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
  bool isControllerReady = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web View'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              if (isControllerReady) {
                _controller.reload();
              }
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
              isControllerReady = true;
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
              // Adjust this condition to allow more URLs if necessary
              if (request.url.startsWith('https://yourwebsite.com')) {
                return NavigationDecision.navigate;
              } else {
                return NavigationDecision.prevent;
              }
            },
            onWebResourceError: (WebResourceError error) {
              print("Failed to load: ${error.description}");
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(),
        ],
      ),
    );
  }
}
