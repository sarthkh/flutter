import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.all(25),
      padding: EdgeInsets.fromLTRB(35, 45, 35, 37),
      child: Text(
        questionText,
        style: TextStyle(
            shadows: [
              Shadow(
                blurRadius: 100,
                color: Color.fromARGB(255, 0, 0, 0),
                offset: Offset(5, 5),
              ),
            ],
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 22,
            color: Color.fromARGB(255, 35, 35, 35)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
