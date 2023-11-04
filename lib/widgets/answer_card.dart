import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/circle_number.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  Widget displayAnswers(String userAnswer, String correctAnswer) {
    final isRightAnswer = userAnswer == correctAnswer;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userAnswer,
          style: TextStyle(
              color: isRightAnswer ? Colors.green[900] : Colors.red[700]),
        ),
        Text(correctAnswer)
      ],
    );
  }

  bool onCheckWrongAnswers(String userAnswer, String correctAnswer) {
    return userAnswer != correctAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleNumber(
              number: (((data['question_index'] as int) + 1).toString()),
              checkWrongAnswer: onCheckWrongAnswers(
                  data['user_answer'] as String,
                  data['correct_answer'] as String),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['question'] as String,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  displayAnswers(data['user_answer'] as String,
                      data['correct_answer'] as String),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
