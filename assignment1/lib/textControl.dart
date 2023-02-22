import 'package:flutter/material.dart';
import './text.dart';

class TextControl extends StatelessWidget {
  final VoidCallback hideTextHandler;
  final Color questionColor;
  final DisplayText text;

  TextControl(this.hideTextHandler, this.questionColor, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(55, 125, 55, 0),
      child: ElevatedButton(
        child: text,
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: questionColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(12.5)),
        onPressed: hideTextHandler,
      ),
    );
  }
}
