import 'package:flutter/material.dart';
import 'package:mamaa_app/verifying.dart';
import 'colors.dart' as color;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class Institutions extends StatefulWidget {
  const Institutions({Key? key}) : super(key: key);

  @override
  State<Institutions> createState() => _InstitutionsState();
}

class _InstitutionsState extends State<Institutions>
    with TickerProviderStateMixin {
  // List of days of the week
  final List<String> _daysOfWeek = [
    'Access Bank',
    'Citibank',
    'Diamond Bank',
    'Ecobank Nigeria',
    'Fidelity Bank Nigeria',
    'First Bank of Nigeria',
    'First City Monument Bank',
    'Guaranty Trust Bank',
    'Heritage Bank Plc',
    'Moniepoint',
    'Opay',
    'Keystone Bank Limited',
    'Kuda MFB',
    'Palmpay',
    'Polaris Bank',
    'Providus Bank Plc',
    'Stanbic IBTC Bank Nigeria Limited',
    'Standard Chartered Bank',
    'Sterling Bank',
    'SunTrust Bank Nigeria Limited',
    'Union Bank of Nigeria',
    'United Bank for Africa',
    'Unity Bank Plc',
    'Wema Bank',
    'Zenith Bank'
  ];

  // The currently selected day
  String? _selectedDay;

  final TextEditingController _institutionsController = TextEditingController();
  final TextEditingController verifController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _loadData();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.4, end: 0.6).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to load data from SharedPreferences
  Future<void> _loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _selectedDay = prefs.getString('day')?.isNotEmpty == true
          ? prefs.getString('day')
          : null;
      _institutionsController.text = prefs.getString('institute') ?? '';
      verifController.text = prefs.getString('verif') ?? '';
    });
  }

  // Function to save data to SharedPreferences
  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('day', _selectedDay ?? '');
    await prefs.setString('institute', _institutionsController.text);
    await prefs.setString('verif', verifController.text);
  }

  void _showLoadingDialog2() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Stack(
          children: [
            // Blurred background
            /*  BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ), */
            // Loading animation
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: child,
                  );
                },
                child: Image.asset(
                  'lib/images/malogo3.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ],
        );
      },
    );

    // Close the loading dialog after 3 seconds
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.of(context).pop();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Verification()),
      );
    });
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Add Bank',
                        style: TextStyle(
                            fontFamily: 'Montserrat SemiBold',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Add a payout account where you would like to receive your funds',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Montserrat Regular',
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 12, top: 0, right: 12),
                          decoration: BoxDecoration(
                              color: color.AppColor.lightgray,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: _institutionsController,
                            style: const TextStyle(
                              fontFamily: 'Montserrat Regular',
                              fontSize: 12,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Enter your account number',
                              labelText: 'Account Number',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat Regular',
                                  fontSize: 12,
                                  color: Colors.grey),
                              border: InputBorder.none,
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 9
                                    ? 'Required'
                                    : null,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: color.AppColor.lightgray),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InputDecorator(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4),
                                      border: InputBorder.none,
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: Container(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          hint: const Text(
                                            "Select bank",
                                            style: TextStyle(
                                                fontFamily:
                                                    'Montserrat Regular',
                                                fontSize: 12,
                                                color: Colors
                                                    .grey), // Custom hint text color
                                          ),
                                          value: _selectedDay,
                                          icon:
                                              const Icon(Icons.arrow_drop_down),
                                          iconSize: 20,
                                          elevation: 16,
                                          style: const TextStyle(
                                              fontFamily: 'Montserrat Regular',
                                              fontSize: 12,
                                              color: Colors
                                                  .black), // Dropdown list values color
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedDay = newValue;
                                            });
                                          },
                                          items: _daysOfWeek
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: const TextStyle(
                                                    fontFamily:
                                                        'Montserrat Regular',
                                                    color: Colors
                                                        .black), // Dropdown list values color
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 12, top: 0, right: 12),
                          decoration: BoxDecoration(
                              color: color.AppColor.lightgray,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: verifController,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Montserrat Regular',
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Enter your Bvn?',
                              labelText: 'Bvn',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat Regular',
                                  fontSize: 12,
                                  color: Colors.grey),
                              border: InputBorder.none,
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 8
                                    ? 'Required'
                                    : null,
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await _saveData();
                            _showLoadingDialog2();
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
                                    "Continue",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat Regular',
                                        color: Colors.white),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
