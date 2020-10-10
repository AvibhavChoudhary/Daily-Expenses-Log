import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transaction_log/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deletetx;
  TransactionList(this._transactions,this._deletetx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _transactions.isEmpty
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
                    height: 400,
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
                      DateFormat.yMMMEd().format(_transactions[index].dateTime),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed:()=> _deletetx(_transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}

// Card(
//           child: Row(
//             children: [
//               Container(
//                 width: 85,
//                 padding: EdgeInsets.all(8),
//                 margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.brown, width: 3),
//                 ),
//                 child: Text(
//                   "₹${_transactions[index].amount.toStringAsFixed(0)}",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     _transactions[index].title,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
//                   ),
//                   Text(
//                     DateFormat.yMMMMEEEEd().format(_transactions[index].dateTime),
//                     style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.grey),
//                   )
//                 ],
//               )
//             ],
//           ),
//         );
