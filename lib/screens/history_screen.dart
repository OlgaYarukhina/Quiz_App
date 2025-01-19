import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/services/quiz_storage.dart';
import 'package:quiz_app/widgets/quiz_card.dart';

class HistoryScreen extends StatelessWidget {
  final List<Quiz> quizzes;

  const HistoryScreen({super.key, required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz History'),
        elevation: 4.0,
      ),
      body: FutureBuilder<Map<String, int>>(
        future: QuizStorage.getAllQuizResults(
          quizzes.map((q) => q.title).toList(),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No history available.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            );
          }

          final history = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(14.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 3 / 2,
              ),
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                final quiz = quizzes[index];
                final result = history[quiz.title] ?? -1; // -1 означає "Not completed"

                return QuizCard(
                  quiz: quiz,
                  isHistory: true,
                  score: result,
                  onTap: () {
                    Navigator.pushNamed(context, '/question', arguments: quiz);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
