import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountControler = TextEditingController();

  NewTransaction(this.addTx);

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
              //onChanged: (val) {
              //  titleInput = val;
              //},
            ),
            TextField(
              controller: amountControler,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              //onChanged: (val) {
              //  amountInput = val;
              //},
            ),
            FlatButton(
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(amountControler.text),
                );
              },
              child: Text('Add transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
