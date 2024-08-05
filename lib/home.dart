import 'package:flutter/material.dart';
import 'package:mamaa_app/givers.dart';
import 'package:mamaa_app/track.dart';
import 'package:mamaa_app/transactions.dart';
import 'package:mamaa_app/notifications.dart';
import 'package:mamaa_app/airtimeconvert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _showCustomDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 240,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFF0E1),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Center(
                        child: Text(
                      'i',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFF9123),
                      ),
                    ))),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Oops",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Perform a task to unlock your earnings and bonus balance",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
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
                                "Got it",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  String? username;

  Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
    });
  }

  @override
  void initState() {
    super.initState();
    // Start a timer to navigate to the next screen after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      // Navigate to the next screen here
      // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
    });

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    loadUsername();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 0, top: 25, right: 0),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                'https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                username ?? 'No username entered',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'Welcome',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Notifications(),
                              ),
                            );
                          },
                          child: Center(child: Container()),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      height:
                          200, // Adjust height to fit the containers and indicator
                      child: Column(
                        children: [
                          Expanded(
                            child: PageView(
                              controller: _pageController,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'lib/images/dashbox.png'), // Path to your image
                                      fit: BoxFit
                                          .cover, // Adjust the image to cover the entire container
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Loan Amounnt',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              height: 18,
                                              width: 18,
                                              child: Image.asset(
                                                'lib/images/naira.png',
                                              )),
                                          Expanded(
                                            child: Text(
                                              _isVisible ? '50,000' : '*****',
                                              style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              _isVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                            onPressed: _toggleVisibility,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      const Text(
                                        'In need of cash ?',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Montserrat SemiBold',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      const Text(
                                        'Request a loan in minutes',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 207, 207, 207),
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            const SizedBox(width: 4),
                                            Text(
                                              'REQUEST LOAN',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              size: 14,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Bonus Balance',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              _isVisible ? 'N0.00' : '*****',
                                              style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              _isVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                            onPressed: _toggleVisibility,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          SmoothPageIndicator(
                            controller: _pageController,
                            count:
                                2, // Adjust the count based on the number of containers
                            effect: const WormEffect(
                                dotHeight: 4,
                                dotWidth: 14,
                                spacing: 6,
                                activeDotColor: Colors.black,
                                dotColor: Color.fromARGB(255, 230, 230, 230)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Text(
                      'Quick Actions',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat Medium'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Track()),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFDFE1FF),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 18,
                                          height: 18,
                                          child: Image.asset(
                                              'lib/images/track.png')),
                                      const Expanded(
                                        child: SizedBox(
                                          height: 2,
                                        ),
                                      ),
                                      const Text(
                                        'Track Loan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      const Text(
                                        'Track current loan',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFF2E38FF)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Givers()),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFDAC6),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 18,
                                          height: 18,
                                          child: Image.asset(
                                              'lib/images/repay.png')),
                                      const Expanded(
                                        child: SizedBox(
                                          height: 2,
                                        ),
                                      ),
                                      const Text(
                                        'Repay Loan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      const Text(
                                        'Track current loan',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFFFE7D37)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xFFEDC6FF),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 18,
                                        height: 18,
                                        child: Image.asset(
                                            'lib/images/historys.png')),
                                    const Expanded(
                                      child: SizedBox(
                                        height: 2,
                                      ),
                                    ),
                                    const Text(
                                      'Airtime to Cash',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Text(
                                      'Convert airtime to cash',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFBB2DFF)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFFF4B8),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 18,
                                        height: 18,
                                        child: Image.asset(
                                            'lib/images/scores.png')),
                                    const Expanded(
                                      child: SizedBox(
                                        height: 2,
                                      ),
                                    ),
                                    const Text(
                                      'Credit Score',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Text(
                                      'Check credit score',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFFEDC600)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Expanded(child: Text('Transactions')),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Transactions()),
                            );
                          },
                          child: Container(
                            height: 20,
                            width: 60,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 233, 233, 233),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'View all',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //New stuffs can go here
                  const SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0xFFFFF0E1),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                                child: Text(
                              'i',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFF9123),
                              ),
                            ))),
                        const SizedBox(height: 10),
                        const Text(
                          'You are yet to perform a transaction',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 100,
                  )

                  //New stuffs can go here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
