import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:transaction_log/models/transaction.dart';
import 'package:transaction_log/widgets/chart.dart';
import 'package:transaction_log/widgets/new_transaction.dart';
import 'package:transaction_log/widgets/transaction_list.dart';

void main() {
  //This code is basically to restrict the orientation of the device.

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: "Transaction Log",
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: "QuickSand",
      ),
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
        amount: 335,
        dateTime: DateTime.now().subtract(Duration(days: 3)),
        id: "aaa",
        title: "Shoes"),
    Transaction(
        amount: 784,
        dateTime: DateTime.now().subtract(Duration(days: 2)),
        id: "bbb",
        title: "Tshirt"),
    Transaction(
        amount: 250,
        dateTime: DateTime.now().subtract(Duration(days: 1)),
        id: "aaa",
        title: "Shoes"),
    Transaction(
        amount: 246,
        dateTime: DateTime.now().subtract(Duration(days: 4)),
        id: "bbb",
        title: "Tshirt"),
    Transaction(
        amount: 257,
        dateTime: DateTime.now().subtract(Duration(days: 3)),
        id: "aaa",
        title: "Shoes"),
    Transaction(
        amount: 475,
        dateTime: DateTime.now().subtract(Duration(days: 6)),
        id: "bbb",
        title: "Tshirt"),
    Transaction(
        amount: 565, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
    Transaction(
        amount: 875,
        dateTime: DateTime.now().subtract(Duration(days: 2)),
        id: "aaa",
        title: "Shoes"),
    Transaction(
        amount: 165, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
    Transaction(
        amount: 578,
        dateTime: DateTime.now().subtract(Duration(days: 5)),
        id: "aaa",
        title: "Shoes"),
    Transaction(
        amount: 956, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
    Transaction(
        amount: 785, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
    Transaction(
        amount: 653,
        dateTime: DateTime.now().subtract(Duration(days: 5)),
        id: "aaa",
        title: "Shoes"),
    Transaction(
        amount: 986, dateTime: DateTime.now(), id: "bbb", title: "Tshirt"),
    Transaction(
        amount: 354,
        dateTime: DateTime.now().subtract(Duration(days: 7)),
        id: "aaa",
        title: "Shoes"),
    Transaction(
        amount: 542,
        dateTime: DateTime.now().subtract(Duration(days: 7)),
        id: "bbb",
        title: "Tshirt"),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransaction {
    return transactions.where((txn) {
      return txn.dateTime.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime date) {
    final newTx = Transaction(
        amount: txAmount,
        dateTime: date,
        id: DateTime.now().toString(),
        title: txTitle);

    setState(() {
      transactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAdnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

 

    final appbar = AppBar(
      title: Text(
        "Transaction Log",
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAdnewTransaction(context),
        )
      ],
    );

   final txList= Container(
                    child: TransactionList(transactions, _deleteTransaction),
                    height: (MediaQuery.of(context).size.height -
                            appbar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7,
                  );

    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if(isLandscape) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Show chart"),
                Switch(
                  value: _showChart,
                  onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  },
                )
              ],
            ),
            if(!isLandscape) Container(
                    child: Chart(_recentTransaction),
                    height: (MediaQuery.of(context).size.height -
                            appbar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.3,
                  ),
              if(!isLandscape) txList,    
           if(isLandscape) _showChart
                ? Container(
                    child: Chart(_recentTransaction),
                    height: (MediaQuery.of(context).size.height -
                            appbar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7,
                  )
                : txList,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAdnewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
