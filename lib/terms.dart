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

class _TermsState extends State<Terms> {
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
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    const Text(
                      'Terms & Condition',
                      style: TextStyle(
                        fontSize: 16,
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
                        child: Container(
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF2E38FF),
                            ),
                            height: 50,
                            child: const Center(
                              child: Text(
                                'Accept',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
