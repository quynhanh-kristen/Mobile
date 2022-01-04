import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final VoidCallback getNextQuote;
  final VoidCallback getPreviousQuote;

  TextControl({required this.getNextQuote, required this.getPreviousQuote});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RaisedButton(
          onPressed: getPreviousQuote,
          child: const Text('< Previous'),
          color: Colors.cyan,
        ),
        RaisedButton(
          onPressed: getNextQuote,
          child: const Text('Next >'),
          color: Colors.lime,
        ),
      ],
    );
  }
}
