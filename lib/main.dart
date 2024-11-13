import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/history_screen.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/services/question_loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Завантажуємо список квізів з файлу
  final List<Quiz> quizzes = await loadQuizzesFromFile(); 

  runApp(QuizApp(quizzes: quizzes));
}

class QuizApp extends StatelessWidget {
  final List<Quiz> quizzes;

  const QuizApp({super.key, required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomeScreen(quizzes: quizzes),
      routes: {
        '/question': (context) => QuestionScreen(),
        '/result': (context) => const ResultScreen(),
        '/history': (context) => const HistoryScreen(),
      },
    );
  }
}
