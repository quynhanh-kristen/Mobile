import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  final String quoteText;

  Quote(this.quoteText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Text(
        quoteText,
        style: TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );

  }
}
