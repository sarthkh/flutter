import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(45, 0, 45, 15),
      child: ElevatedButton(
        // style: ButtonStyle(
        //     backgroundColor: MaterialStateProperty.all<Color>(
        //         Color.fromARGB(255, 50, 90, 145))),
        style: ElevatedButton.styleFrom(
            foregroundColor: Color.fromARGB(255, 255, 255, 255),
            backgroundColor: Color.fromARGB(255, 35, 35, 35),
            textStyle: TextStyle(fontSize: 17.5),
            shape: StadiumBorder(),
            padding: EdgeInsets.all(5),
            elevation: 15),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
