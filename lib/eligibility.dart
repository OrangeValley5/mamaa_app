import 'package:flutter/material.dart';
import 'colors.dart' as color;
//import 'package:iconsax/iconsax.dart';

class Eligibility extends StatefulWidget {
  const Eligibility({Key? key}) : super(key: key);

  @override
  State<Eligibility> createState() => _EligibilityState();
}

class _EligibilityState extends State<Eligibility> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      size: 20,
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
                    color: Color.fromARGB(255, 222, 223, 255),
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
                    color: Color.fromARGB(255, 67, 74, 255),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 8,
                            height: 2.5,
                            color: Colors.white,
                          ),
                        ],
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
                        const Text(
                          '90,000',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 16,
                          ),
                        ],
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
                    color: Color(0xFFF3F3F3),
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
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 144, 136, 255)),
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
                    Row(
                      children: [
                        const Text(
                          'Service Charge',
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
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 144, 136, 255)),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          'N500',
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
            ],
          ),
        ),
      ),
    );
  }
}
