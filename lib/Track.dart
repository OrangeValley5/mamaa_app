import 'package:flutter/material.dart';
import 'dart:async';

import 'colors.dart' as color;

class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  @override
  void initState() {
    super.initState();
    // Start a timer to navigate to the next screen after 5 seconds
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                    height: 10,
                  ),
                  const Text(
                    'Track Loan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Track your loan in progress',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 246, 246, 246),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Amount',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    'N0.00',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 164, 164, 164),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    'No loans',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 164, 164, 164),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    '-',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 164, 164, 164),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            GestureDetector(
                              onTap: () {},
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
                                        "Confirm Status",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              ),
                            ),
                          ],
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
    );
  }
}
