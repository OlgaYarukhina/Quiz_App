import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants.dart';
import 'package:quiz_app/models/quiz.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  QuestionScreenState createState() => QuestionScreenState();
}

class QuestionScreenState extends State<QuestionScreen>
  with TickerProviderStateMixin {
  late Quiz quiz;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  late AnimationController _questionController;
  late Animation<Offset> _questionSlideAnimation;
  List<AnimationController> _answerControllers = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    quiz = ModalRoute.of(context)!.settings.arguments as Quiz;

    // Анімація для питання
    _questionController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _questionSlideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _questionController,
      curve: Curves.easeInOut,
    ));

    // Анімації для відповідей
    _initializeAnswerControllers();
    _questionController.forward();
  }

  void _initializeAnswerControllers() {
    // Очищення попередніх контролерів
    for (var controller in _answerControllers) {
      controller.dispose();
    }
    _answerControllers = [];

    // Ініціалізація нових контролерів
    for (int i = 0; i < quiz.questions[currentQuestionIndex].answers.length; i++) {
      final controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
      );
      _answerControllers.add(controller);
    }

    // Запуск анімації для варіантів відповідей 
    for (int i = 0; i < _answerControllers.length; i++) {
      Future.delayed(Duration(milliseconds: 400 * i), () {
        if (mounted) _answerControllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    _questionController.dispose();
    for (var controller in _answerControllers) {
      controller.dispose();
    }
    super.dispose();
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
            SlideTransition(
              position: _questionSlideAnimation,
              child: Text(
                question.question,
                style:
                     TextStyle(color: AppColors.colors['text1'], fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ...question.answers.asMap().entries.map((entry) {
              final index = entry.key;
              final answer = entry.value;
              return FadeTransition(
                opacity: _answerControllers[index]
                    .drive(CurveTween(curve: Curves.easeIn)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.colors['button'],
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
                          _questionController.reset();
                          _questionController.forward();
                          _initializeAnswerControllers();
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
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
