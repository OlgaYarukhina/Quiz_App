import 'dart:convert';
import 'package:flutter/services.dart'; 
import 'package:quiz_app/models/quiz.dart';

Future<List<Quiz>> loadQuizzesFromFile() async {
  final String response = await rootBundle.loadString('assets/quizzes.json');
  final List<dynamic> data = json.decode(response);
  return data.map((quizJson) => Quiz.fromJson(quizJson)).toList();
}
