import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants.dart';
import 'package:quiz_app/models/quiz.dart';

class QuizCard extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onTap;
  final bool isHistory; 
  final int? score;

  const QuizCard({
    super.key,
    required this.quiz,
    required this.onTap,
    this.isHistory = false,
    this.score,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(       //?????
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 29, 78, 92),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Іконка якщо це не історія або не пройдений тест
              if (!isHistory || score == -1)
                Icon(
                  Icons.quiz,
                  size: 40,
                  color: AppColors.colors['button'],
                ),
              const SizedBox(height: 8.0),
              Text(
                quiz.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.colors['button'],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              // Результат якщо це історія
              if (isHistory && score != -1)
                Text(
                  'Score: $score/${quiz.numberOfQuestions}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.colors['text1'],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
