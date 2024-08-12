import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mamaa_app/congratulations.dart';
import 'package:mamaa_app/dashboard.dart';
import 'package:mamaa_app/eligibility.dart';
import 'package:mamaa_app/firstscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mamaa_app/institutions.dart';
import 'package:mamaa_app/paymentpage.dart';
import 'package:mamaa_app/social.dart';
import 'package:mamaa_app/terms.dart';
import 'package:mamaa_app/transactions.dart';
//import 'package:mamaa_app/utils.dart';
import 'package:mamaa_app/work.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCQPwW4HarOn0RpYxHNs1gx-2JG441QPPk",
          appId: "1:185378870031:web:5b64f92ef6979d6d63247a",
          messagingSenderId: "185378870031",
          projectId: "log-and-chat"));
  runApp(const App());
}

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerKey:
    //Utils.messengerKey;
    navigatorKey:
    navigatorKey;
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: FirstScreen(),
    );
  }
}
