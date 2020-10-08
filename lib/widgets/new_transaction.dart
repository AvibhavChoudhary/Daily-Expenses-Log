import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void onSubmit() {
    final enteredTitle = titleController.text;
    final enteredAmount = int.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            autocorrect: true,
            controller: titleController,
            onSubmitted: (_) => onSubmit(),
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: "Title",
            ),
          ),
          TextField(
            autocorrect: true,
            controller: amountController,
            onSubmitted: (_) => onSubmit(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Amount",
            ),
          ),
          RaisedButton(
              onPressed: onSubmit,
              color: Colors.white60,
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.brown),
              ))
        ],
      ),
    );
  }
}
