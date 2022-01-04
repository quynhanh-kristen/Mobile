import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questions =  [
    {
      'questionText':'What\'s your favorite color ?',
     'answers': [
       {'text':'Black', 'score': 5},
       {'text':'Red', 'score': 4},
       {'text':'Green', 'score': 3}, 
       {'text':'White', 'score': 2}
       ]
     },
    {
      'questionText':'What\'s your favorite animal ?',
     'answers': [
       {'text':'Monkey', 'score': 4},
       {'text':'Dog', 'score': 3},
       {'text':'Cat', 'score': 2}, 
       {'text':'Howl', 'score': 1}
       ]
     },
     {
      'questionText':'What\'s your favorite food ?',
     'answers': [
       {'text':'Eggs', 'score': 4},
       {'text':'Banana', 'score': 3},
       {'text':'Potato', 'score': 2}, 
       {'text':'Avocado', 'score': 1}
       ]
     },
    
  ];
  //questions = [] -> does not work if questions is a const
  var questionIndex = 1;
  var _totalScore = 1;

  void _resetQuiz(){
    setState(() {
      questionIndex = 0;
    _totalScore = 0;
    });
    
  }

  void _answerQuestion(int score) {

    _totalScore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });
    if (questionIndex < _questions.length) {
      print('We have more questions: ');
    }else{
      print('No more question');
    }

    print('Question Index: ' + questionIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My nst app'),
        ),
        body: questionIndex < _questions.length
        ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: questionIndex,
          questions: _questions,)
        : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
