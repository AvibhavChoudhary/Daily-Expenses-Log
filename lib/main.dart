import 'package:flutter/material.dart';
import 'package:transaction_log/models/transaction.dart';
import 'package:transaction_log/widgets/new_transaction.dart';
import 'package:transaction_log/widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.brown),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 final List<Transaction> transactions = [
    Transaction(
        amount: 25, dateTime: DateTime.now(), id: "aaa", title: "Shoes"),
    Transaction(
        amount: 50, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
         Transaction(
        amount: 25, dateTime: DateTime.now(), id: "aaa", title: "Shoes"),
    Transaction(
        amount: 50, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
         Transaction(
        amount: 25, dateTime: DateTime.now(), id: "aaa", title: "Shoes"),
    Transaction(
        amount: 50, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
            Transaction(
        amount: 50, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
         Transaction(
        amount: 25, dateTime: DateTime.now(), id: "aaa", title: "Shoes"),
    Transaction(
        amount: 50, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
         Transaction(
        amount: 25, dateTime: DateTime.now(), id: "aaa", title: "Shoes"),
    Transaction(
        amount: 50, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
            Transaction(
        amount: 50, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
         Transaction(
        amount: 25, dateTime: DateTime.now(), id: "aaa", title: "Shoes"),
    Transaction(
        amount: 50, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
         Transaction(
        amount: 25, dateTime: DateTime.now(), id: "aaa", title: "Shoes"),
    Transaction(
        amount: 50, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
  ];

  void _addNewTransaction(String txTitle, int txAmount) {
    final newTx = Transaction(
        amount: txAmount,
        dateTime: DateTime.now(),
        id: DateTime.now().toString(),
        title: txTitle);

    setState(() {
      transactions.add(newTx);
    });
  }

  void _startAdnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: (){},
            child: NewTransaction(_addNewTransaction),
            behavior:HitTestBehavior.opaque,
            );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction Log"),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: ()=>_startAdnewTransaction(context))],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              child: Text("This is chart area"),
            ),
          TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>_startAdnewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
