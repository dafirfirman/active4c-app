import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Menyimpan jawaban
  static Future<void> saveUserAnswers(List<int?> answers) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> answersString = answers.map((answer) => answer?.toString() ?? 'null').toList();
    await prefs.setStringList('user_answers', answersString);
  }

  // Menyimpan skor
  static Future<void> saveScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', score);
  }

  // Mengambil jawaban
  static Future<List<int?>> getUserAnswers(int questionCount) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedAnswers = prefs.getStringList('user_answers');
    if (savedAnswers != null) {
      return savedAnswers.map((e) => e == 'null' ? null : int.parse(e)).toList();
    } else {
      return List.filled(questionCount, null);
    }
  }

  // Mengambil skor
  static Future<int> getScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('score') ?? 0;
  }
}
