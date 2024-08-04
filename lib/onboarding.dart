import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mamaa_app/signup.dart';
import 'package:mamaa_app/dashboard.dart';
import 'package:mamaa_app/forgotpassword.dart';
import 'colors.dart' as color;

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    navigatorKey:
    navigatorKey;

    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Dashboard();
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding:
                          const EdgeInsets.only(left: 25, top: 40, right: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  height: 300,
                                  width: 300,
                                  child: Image.asset('lib/images/introimg.png'),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                "Get access to",
                                style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: 'Montserrat Bold',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                              const Text(
                                "instant loans",
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.black,
                                    fontFamily: 'Montserrat Bold',
                                    fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Get access to instant loans anywhere you are",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Montserrat Medium',
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontWeight: FontWeight.w200),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Register()),
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Container(
                                          padding: const EdgeInsets.all(15),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xFF2E38FF),
                                          ),
                                          height: 50,
                                          child: const Center(
                                            child: Text(
                                              "Get started",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
