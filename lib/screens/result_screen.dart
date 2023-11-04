import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/questions.dart';
import 'package:flutter_application_1/widgets/answer_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.answers, required this.restartQuiz});

  final List<String> answers;
  final void Function() restartQuiz;

  // combine the answers
  List<Map<String, Object>> getQuizSummary() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < answers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': answers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getQuizSummary();
    final numTotalQuestion = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions of $numTotalQuestion questions correctly!',
              style: const TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 28, 70, 66),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            AnswerCard(summaryData),
            TextButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quiz!'),
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 28, 70, 66),
              ),
            )
          ],
        ),
      ),
    );
  }
}
