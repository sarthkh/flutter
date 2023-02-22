import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  final String displayText;

  DisplayText(this.displayText);

  @override
  Widget build(BuildContext context) {
    return Text(
      displayText,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      textAlign: TextAlign.center,
    );
  }
}
