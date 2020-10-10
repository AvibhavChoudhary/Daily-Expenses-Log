import 'package:flutter/cupertino.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;

  Transaction({@required this.amount,@required this.dateTime,@required this.id, @required this.title,});

}
