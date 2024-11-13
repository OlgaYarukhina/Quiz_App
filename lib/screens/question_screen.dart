import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late Quiz quiz;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Отримуємо переданий квіз через аргументи
    quiz = ModalRoute.of(context)!.settings.arguments as Quiz;
  }

  @override
  Widget build(BuildContext context) {
    final question = quiz.questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title),
      ),
      body: Column(
        children: [
          Text(question.question),
          ...question.answers.map((answer) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  if (answer == question.correctAnswer) {
                    correctAnswers++;
                  }
                  if (currentQuestionIndex < quiz.questions.length - 1) {
                    currentQuestionIndex++;
                  } else {
                    // Перехід до екрану результатів після завершення квізу
                    Navigator.pushNamed(
                      context,
                      '/result',
                      arguments: correctAnswers,
                    );
                  }
                });
              },
              child: Text(answer),
            );
          }).toList(),
        ],
      ),
    );
  }
}
