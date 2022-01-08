import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      //ListView(chidren:[])  <- SingleChildScrollView()
      //ListView.builder() <- need limited item's number
      //ListView.builder() builds widgets as required  (when they can be seen)
      //It's a process that's also called "lazily rendering widgets"
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(                
                    vertical:8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    title: Text(transactions[index].title, style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(DateFormat.yMMMd().format(transactions[index].date),),
                    leading: CircleAvatar(                 
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
