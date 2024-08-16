import 'package:email_validator/email_validator.dart';
import 'package:mamaa_app/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mamaa_app/signup.dart';
import 'package:mamaa_app/moreinfo.dart';
import 'package:mamaa_app/dashboard.dart';
import 'dart:ui';

//import 'package:mamaa_app/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors.dart' as color;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with TickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.4, end: 0.6).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Fetch the conversion rate
  }

  Future<void> _saveUsername() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', usernameController.text);
  }

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _handleTextTap(BuildContext context) {
    // Add your logic here when the text is tapped
    print('Text is tapped!');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const Login()), // Navigate to SecondPage
    );
  }

  void _showLoadingDialog2() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Stack(
          children: [
            // Blurred background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            // Loading animation
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: child,
                  );
                },
                child: Image.asset(
                  'lib/images/malogo3.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ],
        );
      },
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
                return MoreInfo();
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          const EdgeInsets.only(left: 25, top: 30, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontFamily: 'Montserrat Bold',
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Enter your email address and password to create an account",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: 'Montserrat Regular',
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 12, top: 0, right: 12),
                                  decoration: BoxDecoration(
                                      color: color.AppColor.greyish,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    controller: usernameController,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Montserrat Regular',
                                    ),
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your Name',
                                      labelText: 'Name',
                                      prefixIcon: Icon(
                                        Icons.person,
                                        size: 14,
                                      ),
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Montserrat Regular',
                                          color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) =>
                                        value != null && value.length < 3
                                            ? 'Required'
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
                                    controller: emailController,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Montserrat Regular',
                                    ),
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your email address',
                                      labelText: 'Email',
                                      prefixIcon: Icon(
                                        Icons.mail,
                                        size: 14,
                                      ),
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
                                      left: 6, top: 0, right: 12),
                                  decoration: BoxDecoration(
                                    color: color.AppColor.greyish,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Montserrat Regular',
                                    ),
                                    decoration: const InputDecoration(
                                      hintText: '*******',
                                      labelText: 'Password',
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        size: 14,
                                      ),
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
                                            ? 'Required'
                                            : null,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  signUp();
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
                                          "Sign Up",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat Regular',
                                              color: Colors.white),
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
                                onTap: () => _handleTextTap(context),
                                child: const Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontFamily: 'Montserrat Regular',
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                              Center(
                                  child: InkWell(
                                onTap: () => _handleTextTap(context),
                                child: const Text(
                                  " click here to sign in ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Montserrat Regular',
                                      color: Color(0xFF0E0AEC),
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

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', usernameController.text);

    /* showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));*/

    _showLoadingDialog2();

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.pop(context);

      final currentState = navigatorKey.currentState;
      if (currentState != null) {
        currentState.popUntil((route) => route.isFirst);
      }
    } on FirebaseAuthException catch (e) {
      print(e);

      //Utils.showSnackBar(e.message);
      //const AlertDialog(e.message);
      // TODO
    }
  }
}
