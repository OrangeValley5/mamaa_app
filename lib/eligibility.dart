import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'package:intl/intl.dart';
import 'calculator.dart'; // Import the new file

class Eligibility extends StatefulWidget {
  const Eligibility({Key? key}) : super(key: key);

  @override
  State<Eligibility> createState() => _EligibilityState();
}

class _EligibilityState extends State<Eligibility> {
  final NumberFormat currencyFormat = NumberFormat("#,##0");
  late Calculator loanCalculator;

  @override
  void initState() {
    super.initState();
    loanCalculator =
        Calculator(amount: 70000); // Initialize with default amount
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
                  width: 30,
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
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 30, left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 67, 74, 255),
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
                          '1.5%',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                              color: Color.fromARGB(255, 25, 25, 25)),
                        ),
                      ],
                    ),
                    const Text(
                      'Service Charge',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 8,
                          color: Color.fromARGB(255, 25, 25, 25)),
                    ),
                    const Text(
                      '₦500',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 8,
                          color: Color.fromARGB(255, 25, 25, 25)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
                          top: 10, bottom: 10, left: 12, right: 12),
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
                          top: 10, bottom: 10, left: 12, right: 12),
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
                          top: 10, bottom: 10, left: 12, right: 12),
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
                onTap: () {
                  // Handle the Apply Now button tap
                  print("Apply Now tapped");
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 67, 74, 255),
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
