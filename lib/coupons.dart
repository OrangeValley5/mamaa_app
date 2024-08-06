import 'package:flutter/material.dart';
import 'colors.dart' as color;

class Coupons extends StatefulWidget {
  const Coupons({Key? key}) : super(key: key);

  @override
  State<Coupons> createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
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
              'Coupons',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 80),
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset('lib/images/introimg.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Coupon not available',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
              'Get free coupons whenever you repay your loan before due date',
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 178, 178, 178),
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
