import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:quiz_app/questions_summary/question_identifier.dart";

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAns = itemData["user_ans"] == itemData["correct_ans"];

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAns,
            questionIndex: itemData["ques_index"] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData["question"] as String,
                style: GoogleFonts.robotoMono(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                itemData["user_ans"] as String,
                style: GoogleFonts.robotoMono(
                  color: const Color.fromARGB(255, 152, 241, 254),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                itemData["correct_ans"] as String,
                style: GoogleFonts.robotoMono(
                  color: const Color.fromARGB(255, 161, 248, 168),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
