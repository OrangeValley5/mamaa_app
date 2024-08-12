import 'package:flutter/material.dart';
import 'package:mamaa_app/dashboard.dart';
import 'colors.dart' as color;
import 'package:intl/intl.dart';
import 'calculator.dart'; // Import the new file
import 'utils/dialog_util.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Eligibility2 extends StatefulWidget {
  const Eligibility2({Key? key}) : super(key: key);

  @override
  State<Eligibility2> createState() => _Eligibility2State();
}

class _Eligibility2State extends State<Eligibility2>
    with TickerProviderStateMixin {
  final NumberFormat currencyFormat = NumberFormat("#,##0");
  late Calculator loanCalculator;
  late AnimationController _slideController;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final Uri _url = Uri.parse('https://www.example.com');

  @override
  void initState() {
    super.initState();
    loanCalculator =
        Calculator(amount: 70000); // Initialize with default amount
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

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
  }

  Future<void> _saveLoanData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loanAmount = currencyFormat.format(loanCalculator.amount);
    String applicationDate = loanCalculator.getFormattedApplicationDate();

    List<String> loanData = prefs.getStringList('loanData') ?? [];
    loanData.add('$loanAmount - $applicationDate');
    await prefs.setStringList('loanData', loanData);
  }

  void _showBottomModal() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      backgroundColor: Colors.white, // Prevent dismissal
      builder: (BuildContext context) {
        return Container(
          height: 150,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Submitting...',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We are currently submitting and evaluating your loan application for review. This should only take a short while',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 163, 163, 163),
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(),
            ],
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 15), () async {
      Navigator.pop(context);
      if (await canLaunchUrl(_url)) {
        await launchUrl(_url);
      } else {
        throw 'Could not launch $_url';
      }
      // Close the modal after 15 seconds
    });
  }

  void _oopsDialog() {
    Future.delayed(Duration.zero, () {
      _slideController.forward();
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SlideTransition(
            position: _offsetAnimation,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 245, 245, 245),
                    width: 1.0,
                  ),
                ),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                          color: const Color.fromARGB(255, 69, 81, 255)
                              .withOpacity(0.2),
                        ),
                        child: const Center(
                          child: Text(
                            '!',
                            style: TextStyle(
                              color: Color.fromARGB(255, 69, 81, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Application Fee',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14,
                          fontFamily: 'Montserrat SemiBold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Your Application fee for this loan is NGN500. Do you wish to continue?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 168, 168, 168),
                          fontSize: 10,
                          fontFamily: 'Montserrat Regular',
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              _showBottomModal(); // Show the modal when Yes is tapped
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
                                'Yes',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Montserrat Regular',
                                  color: Color.fromARGB(255, 156, 156, 156),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
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
                              child: const Text(
                                'No',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Montserrat Regular',
                                  color: Color.fromARGB(255, 48, 48, 48),
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
            ),
          );
        },
      ).then((_) => _slideController.reset());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
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
                      size: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Eligibility",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 223, 255),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'You can increase your eligible amount by maintaining a good credit score and paying back your outstanding loan before the due date',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Color.fromARGB(255, 72, 82, 255)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "You are eligible to apply for",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 30, left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFF0E0AEC),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          loanCalculator.decreaseAmount();
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 8,
                            height: 2.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 18,
                            width: 18,
                            child: Image.asset(
                              'lib/images/naira.png',
                            )),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          currencyFormat.format(loanCalculator.amount),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          loanCalculator.increaseAmount();
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            width: 2,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(18),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Interest',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                              color: Color.fromARGB(255, 25, 25, 25)),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          height: 12,
                          width: 1,
                          decoration:
                              const BoxDecoration(color: Color(0xFF9088FF)),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          '0.5%',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                              color: Color.fromARGB(255, 25, 25, 25)),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          'Service Charge',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                              color: Color.fromARGB(255, 25, 25, 25)),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '₦500',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                              color: Color.fromARGB(255, 25, 25, 25)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Over how many days ?",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        loanCalculator.updateDueDate(30);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 25, right: 25),
                      decoration: BoxDecoration(
                          color: loanCalculator.selectedDuration == 30
                              ? const Color.fromARGB(255, 67, 74, 255)
                              : const Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        '30 days',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: loanCalculator.selectedDuration == 30
                                ? Colors.white
                                : const Color.fromARGB(255, 25, 25, 25)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        loanCalculator.updateDueDate(60);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 25, right: 25),
                      decoration: BoxDecoration(
                          color: loanCalculator.selectedDuration == 60
                              ? const Color.fromARGB(255, 67, 74, 255)
                              : const Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        '60 days',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: loanCalculator.selectedDuration == 60
                                ? Colors.white
                                : const Color.fromARGB(255, 25, 25, 25)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        loanCalculator.updateDueDate(90);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 25, right: 25),
                      decoration: BoxDecoration(
                          color: loanCalculator.selectedDuration == 90
                              ? const Color.fromARGB(255, 67, 74, 255)
                              : const Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        '90 days',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: loanCalculator.selectedDuration == 90
                                ? Colors.white
                                : const Color.fromARGB(255, 25, 25, 25)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Reference No.',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color.fromARGB(255, 25, 25, 25)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      loanCalculator.referenceNumber,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color.fromARGB(255, 67, 74, 255)),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      'Application Date',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color.fromARGB(255, 25, 25, 25)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      loanCalculator.getFormattedApplicationDate(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color.fromARGB(255, 67, 74, 255)),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      'Payback Date',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color.fromARGB(255, 25, 25, 25)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      loanCalculator.getFormattedDueDate(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color.fromARGB(255, 67, 74, 255)),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      'Payback Amount',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: Color.fromARGB(255, 25, 25, 25)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 10,
                            width: 10,
                            child: Image.asset(
                              'lib/images/naira.png',
                              color: Color.fromARGB(255, 74, 46, 255),
                            )),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          currencyFormat.format(loanCalculator.paybackAmount),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Color.fromARGB(255, 67, 74, 255)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  await _saveLoanData();
                  _oopsDialog();
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );*/
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFF0E0AEC),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
