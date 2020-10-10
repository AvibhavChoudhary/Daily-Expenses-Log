import 'package:flutter/material.dart';
import 'package:transaction_log/models/transaction.dart';
import "package:intl/intl.dart";
import 'package:transaction_log/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].dateTime.day == weekday.day &&
            recentTransaction[i].dateTime.month == weekday.month &&
            recentTransaction[i].dateTime.year == weekday.year) {
          totalSum += recentTransaction[i].amount;
        }
      }

      return {"day": DateFormat.E().format(weekday), "amount": totalSum};
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValue.fold(0, (sum, item) {
      return sum + item["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValue.map((data) {
            return Flexible(
              fit: FlexFit.tight,
                child: ChartBar(
                data["day"],
                data["amount"],
                totalSpending == 0
                    ? 0
                    : (data["amount"] as double ) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
