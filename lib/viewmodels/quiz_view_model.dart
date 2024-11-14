import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/models/quiz.dart';

class QuizViewModel extends ChangeNotifier {
  Quiz currentQuiz;
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;

  QuizViewModel(this.currentQuiz);

  int get currentQuestionIndex => _currentQuestionIndex;
  int get correctAnswers => _correctAnswers;
  Question get currentQuestion => currentQuiz.questions[_currentQuestionIndex];
  bool get isLastQuestion =>
      _currentQuestionIndex == currentQuiz.questions.length - 1;

  // Method for checking answer and update the counter
  void answerQuestion(String selectedAnswer) {
    if (selectedAnswer == currentQuestion.correctAnswer) {
      _correctAnswers++;
    }
    if (!isLastQuestion) {
      _currentQuestionIndex++;
    }
    notifyListeners();
  }

  void updateQuiz(Quiz newQuiz) {
    currentQuiz = newQuiz;
    notifyListeners();
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _correctAnswers = 0;
    notifyListeners();
  }

  getQuizResult() {
    return _correctAnswers;
  }
}
