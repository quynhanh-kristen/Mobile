

import 'package:flutter/material.dart';

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
  final titleController = TextEditingController();
  final amountControler = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountControler.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
    //add function into state object
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
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
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) => submitData(),
              //onChanged: (val) {
              //  titleInput = val;
              //},
            ),
            TextField(
              controller: amountControler,
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
            FlatButton(
              onPressed: submitData,
              child: Text('Add transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
