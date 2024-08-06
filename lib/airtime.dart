import 'package:flutter/material.dart';

class Airtime extends StatefulWidget {
  const Airtime({Key? key}) : super(key: key);

  @override
  State<Airtime> createState() => _AirtimeState();
}

class _AirtimeState extends State<Airtime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset('lib/images/introimg.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Coming soon',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
              'This feature is currently being worked on',
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 178, 178, 178),
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
