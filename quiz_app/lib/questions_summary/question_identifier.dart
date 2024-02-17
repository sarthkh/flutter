import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.isCorrectAnswer, required this.questionIndex});

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;

    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 161, 248, 168)
            : const Color.fromARGB(255, 255, 115, 115),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        questionNumber.toString(),
        style: GoogleFonts.robotoMono(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
