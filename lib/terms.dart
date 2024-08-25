import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mamaa_app/dashboard.dart';
import 'package:mamaa_app/onboarding.dart';
import 'package:mamaa_app/terms_condition.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Define the Tween and the Animation
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start from below the screen
      end: Offset.zero, // End at the original position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    // Start the animation when the page is loaded
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Dashboard();
          }
          return SlideTransition(
            position: _animation, // Apply the sliding animation
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    const Text(
                      'Terms & Condition',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat SemiBold',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      termsAndConditions,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Montserrat Regular',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Onboarding()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF2E38FF),
                        ),
                        child: const Center(
                          child: Text(
                            'Accept',
                            style: TextStyle(
                                fontFamily: 'Montserrat Regular',
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
