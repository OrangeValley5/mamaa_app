import 'package:flutter/material.dart';
import 'colors.dart' as color;

class Givers extends StatefulWidget {
  const Givers({Key? key}) : super(key: key);

  @override
  State<Givers> createState() => _GiversState();
}

class _GiversState extends State<Givers> with TickerProviderStateMixin {
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
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SlideTransition(
        position: _slideAnimation,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                alignment: Alignment.center,
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
                      'Repayment',
                      style: TextStyle(
                          fontFamily: 'Montserrat SemiBold',
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'Repayment days remaining',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Montserrat Regular',
                          color: Colors.black45,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 220,
                          padding: const EdgeInsets.all(18),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 152, 157, 255),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        '0',
                                        style: TextStyle(
                                            color: Color(0xFF2E38FF),
                                            fontSize: 30,
                                            fontFamily: 'Montserrat SemiBold',
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        'Days',
                                        style: TextStyle(
                                            color: Color(0xFF2E38FF),
                                            fontSize: 24,
                                            fontFamily: 'Montserrat SemiBold',
                                            fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 45,
                            decoration: (BoxDecoration(
                                color: const Color(0xFFEBEBEB),
                                borderRadius: BorderRadius.circular(10))),
                            child: const Center(
                                child: (Text(
                              'Repay',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Montserrat Regular',
                                color: Color(0xFF939393),
                              ),
                            ))),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            height: 45,
                            decoration: (BoxDecoration(
                                color: const Color(0xFFEBEBEB),
                                borderRadius: BorderRadius.circular(10))),
                            child: const Center(
                                child: (Text(
                              'Extend',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Montserrat Regular',
                                color: Color(0xFF939393),
                              ),
                            ))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
