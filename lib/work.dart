import 'package:flutter/material.dart';
import 'colors.dart' as color;

class Work extends StatefulWidget {
  const Work({Key? key}) : super(key: key);

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  final TextEditingController workContoller = TextEditingController();

  // List of Filed
  final List<String> _field = [
    'Health & Medicine',
    'Engennering',
    'Hospitality & Social Services',
    'Business & Finance',
    'Information & Communication',
    'Teaching/Education',
    'Community & Social Services',
    'Government Worker',
    'Civil Servant',
    'Transportation',
    'Architecture & Construction',
  ];

  // The currently selected field
  String? _selectedField;

  // List of Filed
  final List<String> _status = [
    'Employed',
    'Self-Employed ',
    'Employee',
    'Unemployed',
  ];

  // The currently selected field
  String? _selectedStatus;

  // The currently selected field

  // List of Filed
  final List<String> _income = [
    'N10,000 - 50,000',
    'N50,000 - N150,000 ',
    'N150,000 - N250,000 ',
    'N250,000 - N500,000 ',
    'N500,000 - N750,000 ',
    'N750,000 & Above'
  ];

  // The currently selected field
  String? _selectedIncome;

  // List of Experience
  final List<String> _experience = [
    '1year - 2years',
    '2years - 3years',
    '3years - 4years',
    '4years - 5years',
    '5years & above',
  ];

  // The currently selected Experience
  String? _selectedExperience;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
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
                "Work Information",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "To enable us serve you better and provide you with the best offer, please ensure you provide the correct information",
                style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 185, 185, 185),
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, top: 0, right: 12),
                decoration: BoxDecoration(
                    color: color.AppColor.lightgray,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: workContoller,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Where do you work ?',
                    labelText: 'Company Name',
                    labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      value != null && value.length < 6 ? 'Required' : null,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, top: 0, right: 12),
                decoration: BoxDecoration(
                    color: color.AppColor.lightgray,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: workContoller,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Where is your work address?',
                    labelText: 'Company Address',
                    labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      value != null && value.length < 6 ? 'Required' : null,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, top: 0, right: 12),
                decoration: BoxDecoration(
                    color: color.AppColor.lightgray,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text(
                          "Specialization",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey), // Custom hint text color
                        ),
                        value: _selectedField,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 20,

                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black), // Dropdown list values color
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedField = newValue;
                          });
                        },
                        items: _field
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors
                                      .black), // Dropdown list values color
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, top: 0, right: 12),
                decoration: BoxDecoration(
                    color: color.AppColor.lightgray,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text(
                          "Employment Status",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey), // Custom hint text color
                        ),
                        value: _selectedStatus,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 20,

                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black), // Dropdown list values color
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedStatus = newValue;
                          });
                        },
                        items: _status
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors
                                      .black), // Dropdown list values color
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, top: 0, right: 12),
                decoration: BoxDecoration(
                    color: color.AppColor.lightgray,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text(
                          "Monthly Income",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey), // Custom hint text color
                        ),
                        value: _selectedIncome,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 20,

                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black), // Dropdown list values color
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedIncome = newValue;
                          });
                        },
                        items: _income
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors
                                      .black), // Dropdown list values color
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, top: 0, right: 12),
                decoration: BoxDecoration(
                    color: color.AppColor.lightgray,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text(
                          "Years of working Experience",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey), // Custom hint text color
                        ),
                        value: _selectedExperience,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 20,

                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black), // Dropdown list values color
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedExperience = newValue;
                          });
                        },
                        items: _experience
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors
                                      .black), // Dropdown list values color
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      //await _saveData();
                      //Navigator.of(context).pop();
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
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 130,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
