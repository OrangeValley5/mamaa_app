import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'package:url_launcher/url_launcher.dart';

class Airtime extends StatefulWidget {
  const Airtime({Key? key}) : super(key: key);

  @override
  State<Airtime> createState() => _AirtimeState();
}

class _AirtimeState extends State<Airtime> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Set up the slide animation controller and animation
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

    _showWelcomeDialog();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  void _showWelcomeDialog() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(
                  color: Color(0xFF232532),
                  width: 1.0,
                ),
              ),
              backgroundColor: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 300,
                      height: 200,
                      child: Image.asset('lib/images/tapp.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            const url = 'https://yourweblink.com';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Montserrat Medium',
                                color: Color(0xFF7540F0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
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
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 25,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: color.AppColor.lightgray),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Airtime to cash',
                style: TextStyle(
                    fontFamily: 'Montserrat SemiBold',
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 80),
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('lib/images/nothing.png'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'Coming soon',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Montserrat SemiBold',
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const Center(
                child: Text(
                  'This feature is currently being worked on',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat Regular',
                      color: Color.fromARGB(255, 178, 178, 178),
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
