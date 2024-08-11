import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mamaa_app/terms_condition.dart';

class Terms2 extends StatefulWidget {
  const Terms2({Key? key}) : super(key: key);

  @override
  State<Terms2> createState() => _Terms2State();
}

class _Terms2State extends State<Terms2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          child: Column(
            children: const [
              Text(
                'Terms & Condition',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                termsAndConditions,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
