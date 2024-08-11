// dialog_util.dart
import 'package:flutter/material.dart';
import 'dart:ui';

class DialogUtil {
  static void showWelcomeDialog(BuildContext context,
      AnimationController slideController, Animation<Offset> offsetAnimation) {
    Future.delayed(Duration.zero, () {
      slideController.forward();
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SlideTransition(
            position: offsetAnimation,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 51, 51, 51),
                    width: 1.0,
                  ),
                ),
                backgroundColor: Color(0xFF191B2A),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 255, 69, 69)
                              .withOpacity(0.2), // Adjust opacity here
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '!',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 8, 8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Application Fee',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 14,
                          fontFamily: 'Montserrat SemiBold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Your application fee for this loan is NGN430. Do you wish to continue ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 201, 201, 201),
                          fontSize: 10,
                          fontFamily: 'Montserrat Regular',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              child: Row(
                                children: const [
                                  Text(
                                    'Yes',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Montserrat Medium',
                                      color: Color(0xFF7540F0),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'No',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Montserrat Medium',
                                      color: Color(0xFF7540F0),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ).then((_) => slideController.reset());
    });
  }
}
