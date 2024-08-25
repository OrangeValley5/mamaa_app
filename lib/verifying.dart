import 'package:flutter/material.dart';
import 'dart:async';

import 'congratulations.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and animation
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start off the screen (bottom)
      end: Offset.zero, // End at the final position (on the screen)
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));

    // Start the slide animation
    _slideController.forward();

    // Start a timer to navigate to the next screen after 25 seconds
    Timer(Duration(seconds: 25), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Congratulations()),
      );
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SlideTransition(
        position: _slideAnimation,
        child: Container(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(height: 80),
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
              const Center(
                child: CircularProgressIndicator(),
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
              const Center(
                child: Text(
                  'Please hold on while we are verifying your identity and the information you have provided',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat Regular',
                      color: Color.fromARGB(255, 178, 178, 178),
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
