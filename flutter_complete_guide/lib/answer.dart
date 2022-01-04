import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
 final Function selectHandler;
 final String answerText;

  Answer(this.selectHandler, this.answerText);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
              child: Text(answerText),
              onPressed: selectHandler, 
              color: Colors.blue,// pass the name of the function, not the result.
              // pass the name of the function, not the result.
              textColor: Colors.white,
            ),
    );
  }
}