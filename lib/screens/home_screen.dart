import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/widgets/quiz_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Quiz> quizzes;

  const HomeScreen({super.key, required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Application'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 8.0, 
            mainAxisSpacing: 8.0, 
            childAspectRatio: 3 / 2, // Співвідношення сторін карток
          ),
          itemCount: quizzes.length,
          itemBuilder: (context, index) {
            final quiz = quizzes[index];
            return QuizCard(
              quiz: quiz,
              onTap: () {
                Navigator.pushNamed(context, '/question', arguments: quiz);
              },
            );
          },
        ),
      ),
    );
  }
}