import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transaction_log/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deletetx;
  TransactionList(this._transactions, this._deletetx);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return _transactions.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No transactions yet.",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                    height: constraints.maxHeight * 0.5,
                    child: Image.asset(
                      "asset/images/txn.jpg",
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  shadowColor: Colors.brown,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  elevation: 6,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FittedBox(
                            child: Text(
                                "${_transactions[index].amount.toStringAsFixed(0)}")),
                      ),
                    ),
                    title: Text(
                      _transactions[index].title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMEd()
                          .format(_transactions[index].dateTime),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: MediaQuery.of(context).size.width > 460 ?
                    FlatButton.icon(onPressed: ()=> _deletetx(_transactions[index].id),
                    textColor: Colors.red,
                     icon: Icon(Icons.delete),
                      label: Text("Delete")):
                      IconButton(
                        color: Colors.red,
                        icon:Icon(Icons.delete),
                        onPressed: () => _deletetx(_transactions[index].id)),
                    
                  ),
                );
              },
              itemCount: _transactions.length,
            );
    });
  }
}
