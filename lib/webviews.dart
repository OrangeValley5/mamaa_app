import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  // Define your URL here
  final String _url = 'https://www.example.com';

  // Function to launch the URL
  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(_url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
          mode: LaunchMode.inAppWebView); // Opens in a new tab or window
    } else {
      throw 'Could not launch $_url';
    }
  }

  // Function to show the bottom modal
  void _showBottomModal() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Submitting...',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We are currently submitting and evaluating your loan application for review. This should only take a short while',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 163, 163, 163),
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(),
            ],
          ),
        );
      },
    );

    // Close the modal after 5 seconds and then launch the URL
    Future.delayed(const Duration(seconds: 5), () async {
      Navigator.pop(context); // Close the modal
      _launchURL(); // Open the URL
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showBottomModal,
          child: const Text('Show Modal'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyHomePage2(),
  ));
}
