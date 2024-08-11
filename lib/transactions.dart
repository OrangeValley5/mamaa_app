import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  List<String> loanData = [];

  @override
  void initState() {
    super.initState();
    _loadLoanData();
  }

  Future<void> _loadLoanData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loanData = prefs.getStringList('loanData') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: loanData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(loanData[index]),
          );
        },
      ),
    );
  }
}
