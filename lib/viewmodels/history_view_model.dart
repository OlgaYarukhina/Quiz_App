import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryViewModel extends ChangeNotifier {
  List _results = [];

  List get results => _results;

  // Метод для завантаження історії з локального зберігання
  Future<void> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final resultsString = prefs.getString('quiz_history');
    if (resultsString != null) {
      
     // _results = 
      notifyListeners();
    }
  }

  // Метод для додавання нового результату до історії
  Future<void> addResult(result) async {
    _results.add(result);
    final prefs = await SharedPreferences.getInstance();
    final results = "result";
    await prefs.setString('quiz_history', results);
    notifyListeners();
  }
}
