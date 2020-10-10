import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void onSubmit() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Card(
        elevation: 6,
        child: Container(
          padding: EdgeInsets.only(top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                autocorrect: true,
                controller: _titleController,
                onSubmitted: (_) => onSubmit(),
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: "Title",
                ),
              ),
              TextField(
                autocorrect: true,
                controller: _amountController,
                onSubmitted: (_) => onSubmit(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Amount",
                ),
              ),
              Row(
                children: [
                  Text(_selectedDate == null
                      ? "No date chosen"
                      : "Picked date: ${DateFormat.yMMMMd().format(_selectedDate)}"),
                  FlatButton(
                      onPressed: _presentDatePicker,
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        "Pick a date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
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
        ),
      ),
    );
  }
}
