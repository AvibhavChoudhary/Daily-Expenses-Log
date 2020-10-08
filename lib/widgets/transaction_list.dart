import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transaction_log/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  TransactionList(this._transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context,index){
          return Card(
          child: Row(
            children: [
              Container(
                width: 85,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown, width: 3),
                ),
                child: Text(
                  "₹${_transactions[index].amount}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _transactions[index].title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    DateFormat.yMMMMEEEEd().format(_transactions[index].dateTime),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        );
        },
      itemCount: _transactions.length,
        
        ),
    );
  }
}
