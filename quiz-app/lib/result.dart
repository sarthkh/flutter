import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore > 0 && resultScore <= 10) {
      resultText = 'You\'re strange';
    } else if (resultScore > 10 && resultScore <= 15) {
      resultText = 'You\'re okay';
    } else if (resultScore > 15 && resultScore <= 20) {
      resultText = 'You\'ve got taste';
    } else if (resultScore > 20 && resultScore <= 25) {
      resultText = 'You\'re awesome';
    } else if (resultScore == 0) {
      resultText = 'You have no personality..';
    } else {
      resultText = 'You should probably like new things';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
                color: Color.fromARGB(255, 35, 35, 35), fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            child: Text('Restart'),
            onPressed: resetHandler,
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              foregroundColor: Color.fromARGB(255, 255, 255, 255),
              backgroundColor: Color.fromARGB(255, 35, 35, 35),
            ),
          ),
        ],
      ),
    );
  }
}
