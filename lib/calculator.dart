import 'package:intl/intl.dart';

class Calculator {
  int amount;
  double interestRate;
  int serviceCharge;
  DateTime applicationDate;
  DateTime? dueDate;
  int selectedDuration;
  int paybackAmount;
  String referenceNumber;

  Calculator({
    required this.amount,
    this.interestRate = 0.074,
    this.serviceCharge = 500,
    DateTime? applicationDate,
    this.selectedDuration = 0,
    this.referenceNumber = "REFXDJHU6H8U80",
  })  : applicationDate = applicationDate ?? DateTime.now(),
        dueDate = null,
        paybackAmount = 0;

  // Function to decrease the amount
  void decreaseAmount() {
    if (amount > 5000) {
      amount -= 5000;
      _calculatePaybackAmount();
    }
  }

  // Function to increase the amount
  void increaseAmount() {
    if (amount < 30000) {
      amount += 5000;
      _calculatePaybackAmount();
    }
  }

  // Function to update the due date and recalculate the payback amount
  void updateDueDate(int days) {
    selectedDuration = days;
    dueDate = applicationDate.add(Duration(days: days));
    _calculatePaybackAmount();
  }

  // Function to calculate the total payback amount
  void _calculatePaybackAmount() {
    if (selectedDuration != 0) {
      int interestAmount =
          (amount * interestRate * (selectedDuration / 30)).toInt();
      paybackAmount = amount + interestAmount + serviceCharge;
    } else {
      paybackAmount = 0;
    }
  }

  String getFormattedApplicationDate() {
    return DateFormat.yMMMd().format(applicationDate);
  }

  String getFormattedDueDate() {
    return dueDate != null
        ? DateFormat.yMMMd().format(dueDate!)
        : 'Select a duration to see due date';
  }
}
