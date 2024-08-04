import 'package:email_validator/email_validator.dart';
import 'package:mamaa_app/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mamaa_app/signup.dart';
import 'package:mamaa_app/moreinfo.dart';
import 'package:mamaa_app/dashboard.dart';
import 'package:mamaa_app/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors.dart' as color;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //_showUsernameDialog();
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
    super.dispose();
  }

  void _handleTextTap(BuildContext context) {
    // Add your logic here when the text is tapped
    print('Text is tapped!');
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const Login()), // Navigate to SecondPage
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
                          const EdgeInsets.only(left: 25, top: 80, right: 25),
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
                            "Enter your email address and password to continue",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: 'Montserrat Medium',
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
                                      labelStyle: TextStyle(
                                          fontSize: 14,
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
                                          fontSize: 14,
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
                                      labelStyle: TextStyle(
                                          fontSize: 14,
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
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: signUp,
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF0E0AEC),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: const Text(
                                      "Sign up",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat Regular',
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    )),
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

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

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

      Utils.showSnackBar(e.message);
      //const AlertDialog(e.message);
      // TODO
    }
  }
}
