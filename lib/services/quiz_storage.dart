import 'package:shared_preferences/shared_preferences.dart';

class QuizStorage {
  static const _resultPrefix = 'result_';

  static Future<void> saveQuizResult(String quizTitle, int score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('$_resultPrefix$quizTitle', score);
  }
  
  static Future<Map<String, int>> getAllQuizResults(List<String> quizTitles) async {
    final prefs = await SharedPreferences.getInstance();
    final results = <String, int>{};
    for (var title in quizTitles) {
      results[title] = prefs.getInt('$_resultPrefix$title') ?? -1;
    }
    return results;
  }
}








  // static Future<int> getQuizResult(String quizTitle) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getInt('$_resultPrefix$quizTitle') ?? -1;
  // }