import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiwayatQuizPage extends StatefulWidget {
  const RiwayatQuizPage({Key? key}) : super(key: key);

  @override
  _RiwayatQuizPageState createState() => _RiwayatQuizPageState();
}

class _RiwayatQuizPageState extends State<RiwayatQuizPage> {
  List<Map<String, dynamic>> _quizHistory = [];

  @override
  void initState() {
    super.initState();
    _loadQuizHistory();
  }

  Future<void> _loadQuizHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final history = prefs.getStringList('fitness_quiz_history');
      if (history != null) {
        setState(() {
          _quizHistory =
              history.map((item) {
                final parts = item.split('|');
                return {
                  'correct': int.parse(parts[0]),
                  'total': int.parse(parts[1]),
                  'date': parts[2],
                  'score': '${parts[0]}/${parts[1]}',
                };
              }).toList();
        });
      }
    } catch (e) {
      debugPrint('Error loading quiz history: $e');
    }
  }

  Future<void> _deleteHistory(int index) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _quizHistory.removeAt(index);
      });
      final historyList =
          _quizHistory
              .map(
                (item) => '${item['correct']}|${item['total']}|${item['date']}',
              )
              .toList();
      await prefs.setStringList('freestyle_quiz_history', historyList);
    } catch (e) {
      debugPrint('Error deleting history: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Gagal menghapus riwayat')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.orange,
        title: Text(
          'RIWAYAT KUIS',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:
          _quizHistory.isEmpty
              ? const Center(child: Text('Belum ada riwayat kuis'))
              : ListView.builder(
                itemCount: _quizHistory.length,
                itemBuilder: (context, index) {
                  final result = _quizHistory[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      title: Text(
                        'Skor: ${result['score']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              int.parse(result['score'].split('/')[0]) /
                                          int.parse(
                                            result['score'].split('/')[1],
                                          ) >
                                      0.6
                                  ? Colors.green
                                  : Colors.orange,
                        ),
                      ),
                      subtitle: Text(result['date']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteHistory(index),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
