import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  QuestionScreenState createState() => QuestionScreenState(); 
}

class QuestionScreenState extends State<QuestionScreen> {
  late Quiz quiz;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    quiz = ModalRoute.of(context)!.settings.arguments as Quiz;
  }

  @override
  Widget build(BuildContext context) {
    final question = quiz.questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...question.answers.map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      if (answer == question.correctAnswer) {
                        correctAnswers++;
                      }
                      if (currentQuestionIndex < quiz.questions.length - 1) {
                        currentQuestionIndex++;
                      } else {
                        Navigator.pushNamed(
                          context,
                          '/result',
                          arguments: {
                            'score': correctAnswers,
                            'quizTitle': quiz.title
                          },
                        );
                      }
                    });
                  },
                  child: Text(answer),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
