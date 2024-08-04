import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mamaa_app/signup.dart';
import 'package:mamaa_app/dashboard.dart';
import 'package:mamaa_app/forgotpassword.dart';
import 'colors.dart' as color;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleTextTap(BuildContext context) {
    // Add your logic here when the text is tapped
    print('Text is tapped!');
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const ForgotPassword()), // Navigate to SecondPage
    );
  }

  void _handleTextTap2(BuildContext context) {
    // Add your logic here when the text is tapped
    print('Text is tapped!');
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const Register()), // Navigate to SecondPage
    );
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
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                return Dashboard();
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          const EdgeInsets.only(left: 25, top: 80, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome back!",
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Montserrat Bold',
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Enter your email address and password to continue",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontFamily: 'Montserrat Medium',
                                fontWeight: FontWeight.w300),
                          ),
                          Container(),
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 12, top: 0, right: 12),
                            decoration: BoxDecoration(
                                color: color.AppColor.greyish,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              controller: emailController,
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Montserrat Regular',
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Enter your email address',
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Montserrat Regular',
                                    color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 12, top: 0, right: 12),
                            decoration: BoxDecoration(
                                color: color.AppColor.greyish,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              controller: passwordController,
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Montserrat Regular',
                              ),
                              decoration: const InputDecoration(
                                hintText: '*******',
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Montserrat Regular',
                                    color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  value != null && value.length < 6
                                      ? 'Password should be up to 8 characters'
                                      : null,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () => _handleTextTap(context),
                                child: const Text(
                                  "forgot password ?",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Montserrat Regular',
                                      color: Colors.grey),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  signIn();
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
                                          "Sign In",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: InkWell(
                                onTap: () => _handleTextTap2(context),
                                child: const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontFamily: 'Montserrat Regular'),
                                ),
                              )),
                              Center(
                                  child: InkWell(
                                onTap: () => _handleTextTap2(context),
                                child: const Text(
                                  " click here to create one ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF0E0AEC),
                                      fontFamily: 'Montserrat Regular',
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
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

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Close the dialog after sign-in
      Navigator.pop(context);

      final currentState = navigatorKey.currentState;
      if (currentState != null) {
        currentState.popUntil((route) => route.isFirst);
      }
    } on FirebaseAuthException catch (e) {
      // TODO

    }
  }
}
