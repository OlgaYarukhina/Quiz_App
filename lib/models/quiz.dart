import 'package:quiz_app/models/question.dart';

class Quiz {
  final String title; 
  final int numberOfQuestions;
  final List<Question> questions; 

  Quiz({
    required this.title,
    required this.numberOfQuestions,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      title: json['title'],
      numberOfQuestions: json['numberOfQuestions'],
      questions: (json['questions'] as List)
          .map((questionJson) => Question.fromJson(questionJson))
          .toList(),
    );
  }
}
