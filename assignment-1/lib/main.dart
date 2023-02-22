// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';
import './text.dart';
import './textControl.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _myAppState();
  }
}

class _myAppState extends State<myApp> {
  bool isHidden = true;
  var questionText = DisplayText('Do you play games?');

  void _showAnswer() {
    questionText = DisplayText('Nope');

    setState(() {
      isHidden = false;
    });

    print('set to false');
  }

  void _showQuestion() {
    questionText = DisplayText('Do you play games?');

    setState(() {
      isHidden = true;
    });
    print('set to true');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          title: Text('Flutter Assignment'),
          backgroundColor: Colors.grey[850],
        ),
        body: isHidden
            ? TextControl(_showAnswer, Colors.green.shade300, questionText)
            : TextControl(_showQuestion, Colors.red.shade300, questionText)
      ),
    );
  }
}
