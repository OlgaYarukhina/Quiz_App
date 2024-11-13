import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz.dart';

class HomeScreen extends StatelessWidget {
  final List<Quiz> quizzes;

  const HomeScreen({super.key, required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Application'),
      ),
      body: ListView.builder(
        itemCount: quizzes.length,
        itemBuilder: (context, index) {
          final quiz = quizzes[index];
          return ListTile(
            title: Text(quiz.title),
            onTap: () {
              // Передаємо вибраний квіз на екран запитань
              Navigator.pushNamed(
                context,
                '/question',
                arguments: quiz, // Передаємо квіз як аргумент
              );
            },
          );
        },
      ),
    );
  }
}
