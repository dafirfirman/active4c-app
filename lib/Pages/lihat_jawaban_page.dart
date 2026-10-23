import 'package:flutter/material.dart';

class LihatJawabanPage extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final List<int?> userAnswers;

  const LihatJawabanPage({Key? key, required this.questions, required this.userAnswers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00E1FF),
        title: const Text('Lihat Jawaban'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index]['question'];
            final userAnswer = userAnswers[index];
            final correctAnswer = questions[index]['correctAnswer'];
            return ListTile(
              title: Text(question),
              subtitle: Text('Jawaban Anda: ${questions[index]['answers'][userAnswer ?? -1] ?? "Tidak Dijawab"}'),
              trailing: Icon(
                userAnswer == correctAnswer ? Icons.check_circle : Icons.cancel,
                color: userAnswer == correctAnswer ? Colors.green : Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }
}
