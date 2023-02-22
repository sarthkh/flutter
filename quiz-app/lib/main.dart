import 'package:flutter/material.dart';
// import './question.dart';
// import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(myApp());
}

// void main() => runApp(myApp()); // shorthand for functions which only have one and exactly one expression

class myApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _myAppState();
  }
}

class _myAppState extends State<myApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': '1. What\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 1},
        {'text': 'Green', 'score': 2},
        {'text': 'Blue', 'score': 4},
        {'text': 'Black', 'score': 5},
        {'text': 'Yellow', 'score': 3}
      ],
    },
    {
      'questionText': '2. What\'s your favorite food?',
      'answers': [
        {'text': 'Burger', 'score': 1},
        {'text': 'Pizza', 'score': 2},
        {'text': 'Sushi', 'score': 4},
        {'text': 'Ramen', 'score': 5},
        {'text': 'Burrito', 'score': 3}
      ],
    },
    {
      'questionText': '3. Which is your favorite place?',
      'answers': [
        {'text': 'Mumbai', 'score': 4},
        {'text': 'Tokyo', 'score': 5},
        {'text': 'Hong Kong', 'score': 1},
        {'text': 'Dubai', 'score': 3},
        {'text': 'New York', 'score': 2}
      ],
    },
    {
      'questionText': '4. Which is your favorite game?',
      'answers': [
        {'text': 'Call of Duty: Warzone', 'score': 2},
        {'text': 'Cyberpunk', 'score': 5},
        {'text': 'Valorant', 'score': 3},
        {'text': 'Minecraft', 'score': 1},
        {'text': 'GTA V', 'score': 4}
      ],
    },
    {
      'questionText': '5. What\'s is your movie genre?',
      'answers': [
        {'text': 'Horror', 'score': 5},
        {'text': 'Action', 'score': 2},
        {'text': 'Comedy', 'score': 3},
        {'text': 'Romance', 'score': 4},
        {'text': 'Drama', 'score': 1}
      ],
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    // if (_questionIndex == 3) {
    //   _questionIndex = 0;
    // }
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 35, 35, 35),
          title: Text('Personality Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
