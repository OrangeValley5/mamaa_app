import 'package:flutter/material.dart';
import 'package:mamaa_app/congratulations.dart';
import 'dart:async';

import 'package:mamaa_app/terms.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification>
    with TickerProviderStateMixin {
  void initState() {
    super.initState();
    // Start a timer to navigate to the next screen after 5 seconds
    Timer(Duration(seconds: 25), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Congratulations()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(height: 80),
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset('lib/images/hangon.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Verifying Details',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Montserrat Medium',
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Please hold on while we are verifying your identity and the information you have provided',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat Regular',
                      color: Color.fromARGB(255, 178, 178, 178),
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
