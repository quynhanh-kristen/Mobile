import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

//Stateless Widget: whenever it reset or re-evaluated, the data which user input will be lost
//Stateful Widget: it is a seperated state object (state class)
// whenever re-evaluated by Flutter, the state will be detached from this reset/re-evaluated process
// so the data store in this kind of object will not be lost
class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    if(_amountControler.text.isEmpty){
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountControler.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    //add function into state object
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,// must have, to match with _addNewTransaction in main.dart
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
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
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) => submitData(),
              //onChanged: (val) {
              //  titleInput = val;
              //},
            ),
            TextField(
              controller: _amountControler,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              //On iOS, this might not allow for decimal places
              //Use TextInputType.numberWithOptions(decimal:true) instead then.
              onSubmitted: (_) => submitData(),
              //onChanged: (val) {
              //  amountInput = val;
              //},
            ),
            Container(
              height: 50,
              child: Row(children: <Widget>[
                Expanded(
                    child: Text(
                  _selectedDate == null
                      ? 'No date chosen !'
                      : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                )),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Choose date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]),
            ),
            RaisedButton(
              onPressed: submitData,
              child: Text('Add transaction'),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
