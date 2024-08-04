import 'package:flutter/material.dart';
import 'package:mamaa_app/splashscreen.dart';
import 'package:mamaa_app/onboarding.dart';
import 'dart:async';
import 'package:mamaa_app/utils.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer to navigate to the next screen after 5 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Onboarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerKey:
    Utils.messengerKey;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mamaa',
                    style: TextStyle(
                        fontSize: 20, fontFamily: 'Montserrat SemiBold'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
