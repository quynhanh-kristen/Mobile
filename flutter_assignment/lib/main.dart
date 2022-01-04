// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text
import 'package:flutter/material.dart';
import 'package:flutter_assignment/quote.dart';
import './textcontrol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _quotes = ['Keep moving forward', 'Never give up', 'Try your best'];
  int quoteIndex = 0;

  void getNextQuote() {
    setState(() {
      quoteIndex += 1;
      print('Quotes Index: ' + quoteIndex.toString());
    });
    restartIndex();
  }
  void getPreviousQuote() {
    setState(() {
      quoteIndex -= 1;
      print('Quotes Index: ' + quoteIndex.toString());
    });
    restartIndex();
  }

  void restartIndex(){
    if(quoteIndex == _quotes.length){
      quoteIndex = 0;
    }
    if(quoteIndex == -1){
      quoteIndex = _quotes.length - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Assignment: Text Transition'),
        ),
        body: Container(
          child: Column(
            children: [
              Quote((quoteIndex + 1).toString() + '. ' + _quotes[quoteIndex]),
              TextControl(getNextQuote: getNextQuote, getPreviousQuote: getPreviousQuote),
            ],
          ),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
