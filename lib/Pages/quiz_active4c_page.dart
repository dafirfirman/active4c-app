import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'riwayat_quiz_page.dart'; // Import halaman riwayat

class QuizActive4cPage extends StatefulWidget {
  const QuizActive4cPage({Key? key}) : super(key: key);

  @override
  _QuizActive4cPageState createState() => _QuizActive4cPageState();
}

class _QuizActive4cPageState extends State<QuizActive4cPage> {
  int _currentQuestionIndex = 0;
  List<int?> _userAnswers = [];
  List<String> _shortAnswers = [];
  List<Map<String, dynamic>> _quizHistory = [];
  final List<TextEditingController> _textControllers = [];
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _questions = [
    // Pilihan Berganda (10 Soal)
    {
      'question': '1. Apa yang dimaksud dengan latihan kecepatan dalam kebugaran jasmani?',
      'answers': [
        'a. Latihan untuk meningkatkan kekuatan otot',
        'b. Latihan untuk meningkatkan daya tahan jantung dan paru-paru',
        'c. Latihan untuk meningkatkan kemampuan bergerak cepat dalam waktu singkat',
        'd. Latihan untuk meningkatkan kelincahan tubuh'
      ],
      'correctAnswer': 2,
      'type': 'multiple_choice'
    },
    {
      'question': '2. Manakah dari latihan berikut yang paling efektif untuk meningkatkan kelincahan?',
      'answers': [
        'a. Latihan lompat tali',
        'b. Latihan squat jump',
        'c. Latihan shuttle run',
        'd. Latihan push-up'
      ],
      'correctAnswer': 2,
      'type': 'multiple_choice'
    },
    {
      'question': '3. Salah satu manfaat dari latihan keseimbangan adalah:',
      'answers': [
        'a. Meningkatkan kekuatan otot tangan',
        'b. Membantu menjaga postur tubuh yang baik',
        'c. Mengurangi rasa sakit setelah latihan',
        'd. Mempercepat pertumbuhan otot'
      ],
      'correctAnswer': 1,
      'type': 'multiple_choice'
    },
    {
      'question': '4. Bagaimana cara terbaik untuk meningkatkan koordinasi antara tangan dan mata?',
      'answers': [
        'a. Dengan berlatih angkat beban',
        'b. Dengan bermain bola basket atau sepak bola',
        'c. Dengan latihan lari cepat',
        'd. Dengan latihan renang gaya bebas'
      ],
      'correctAnswer': 1,
      'type': 'multiple_choice'
    },
    {
      'question': '5. Dalam konteks kebugaran jasmani, apa yang dimaksud dengan daya tahan?',
      'answers': [
        'a. Kemampuan tubuh untuk bergerak cepat',
        'b. Kemampuan tubuh untuk bertahan dalam aktivitas fisik yang lama',
        'c. Kemampuan tubuh untuk melakukan gerakan secara dinamis',
        'd. Kemampuan tubuh untuk mengangkat beban berat'
      ],
      'correctAnswer': 1,
      'type': 'multiple_choice'
    },
    {
      'question': '6. Latihan mana yang paling efektif untuk meningkatkan kekuatan otot kaki?',
      'answers': [
        'a. Push-up',
        'b. Squat',
        'c. Sit-up',
        'd. Plank'
      ],
      'correctAnswer': 1,
      'type': 'multiple_choice'
    },
    {
      'question': '7. Manakah dari latihan berikut yang membantu meningkatkan kelincahan dan keseimbangan?',
      'answers': [
        'a. Berjalan di atas garis lurus',
        'b. Push-up dengan tangan',
        'c. Latihan lompat jauh',
        'd. Latihan jongkok'
      ],
      'correctAnswer': 0,
      'type': 'multiple_choice'
    },
    {
      'question': '8. Latihan kardio berfungsi untuk:',
      'answers': [
        'a. Meningkatkan ketahanan otot',
        'b. Meningkatkan daya tahan jantung dan paru-paru',
        'c. Meningkatkan kelincahan tubuh',
        'd. Meningkatkan kelenturan otot'
      ],
      'correctAnswer': 1,
      'type': 'multiple_choice'
    },
    {
      'question': '9. Salah satu contoh latihan untuk meningkatkan keseimbangan adalah:',
      'answers': [
        'a. Push-up',
        'b. Jongkok',
        'c. Berdiri di atas satu kaki',
        'd. Sit-up'
      ],
      'correctAnswer': 2,
      'type': 'multiple_choice'
    },
    {
      'question': '10. Apa yang dimaksud dengan "coaching" dalam konteks kebugaran jasmani?',
      'answers': [
        'a. Mengajarkan teori tentang olahraga',
        'b. Memberikan instruksi latihan kepada individu atau kelompok',
        'c. Membantu siswa mengikuti lomba olahraga',
        'd. Menilai hasil kebugaran siswa'
      ],
      'correctAnswer': 1,
      'type': 'multiple_choice'
    },
    // Benar/Salah (5 Soal)
    {
      'question': '11. Latihan yang teratur dapat membantu meningkatkan kebugaran jasmani dan daya tahan tubuh.',
      'answers': ['Benar', 'Salah'],
      'correctAnswer': 0,
      'type': 'true_false'
    },
    {
      'question': '12. Kelincahan tidak berpengaruh pada kemampuan seorang siswa dalam memainkan bola basket.',
      'answers': ['Benar', 'Salah'],
      'correctAnswer': 1,
      'type': 'true_false'
    },
    {
      'question': '13. Latihan keseimbangan dapat dilakukan hanya dengan menggunakan alat bantu seperti bola fitness.',
      'answers': ['Benar', 'Salah'],
      'correctAnswer': 1,
      'type': 'true_false'
    },
    {
      'question': '14. Kardio dapat dilakukan dengan berbagai jenis aktivitas, seperti berlari, bersepeda, dan berenang.',
      'answers': ['Benar', 'Salah'],
      'correctAnswer': 0,
      'type': 'true_false'
    },
    {
      'question': '15. Latihan kelincahan hanya dilakukan dengan melompat atau berlari cepat.',
      'answers': ['Benar', 'Salah'],
      'correctAnswer': 1,
      'type': 'true_false'
    },
    // Isian Singkat (5 Soal)
    {
      'question': '16. Sebutkan dua manfaat dari latihan kebugaran jasmani untuk kesehatan mental!',
      'answers': [],
      'correctAnswer': 0,
      'type': 'short_answer'
    },
    {
      'question': '17. Apa yang dimaksud dengan latihan shuttle run dalam kebugaran jasmani?',
      'answers': [],
      'correctAnswer': 0,
      'type': 'short_answer'
    },
    {
      'question': '18. Sebutkan dua contoh latihan untuk meningkatkan kekuatan otot kaki!',
      'answers': [],
      'correctAnswer': 0,
      'type': 'short_answer'
    },
    {
      'question': '19. Jelaskan apa yang dimaksud dengan keseimbangan dalam konteks kebugaran jasmani!',
      'answers': [],
      'correctAnswer': 0,
      'type': 'short_answer'
    },
    {
      'question': '20. Apa saja yang dapat mempengaruhi kelincahan dalam kebugaran jasmani?',
      'answers': [],
      'correctAnswer': 0,
      'type': 'short_answer'
    },
  ];

  @override
  void initState() {
    super.initState();
    _userAnswers = List.filled(_questions.length, null);
    _shortAnswers = List.filled(_questions.length, '');
    _textControllers.addAll(
      List.generate(_questions.length, (index) => TextEditingController()),
    );
    _loadQuizHistory();
  }

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadQuizHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final history = prefs.getStringList('fitness_quiz_history');
      if (history != null) {
        setState(() {
          _quizHistory = history.map((item) {
            final parts = item.split('|');
            return {
              'correct': int.parse(parts[0]),
              'total': int.parse(parts[1]),
              'date': parts[2],
              'score': '${parts[0]}/${parts[1]}'
            };
          }).toList();
        });
      }
    } catch (e) {
      debugPrint('Error loading quiz history: $e');
    }
  }

  Future<void> _saveQuizHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final historyList = _quizHistory
          .map((item) => '${item['correct']}|${item['total']}|${item['date']}')
          .toList();
      await prefs.setStringList('fitness_quiz_history', historyList);
    } catch (e) {
      debugPrint('Error saving quiz history: $e');
    }
  }

  void _answerQuestion(int answerIndex) {
    setState(() {
      _userAnswers[_currentQuestionIndex] = answerIndex;
    });
  }

  void _answerShortQuestion(String answer) {
    setState(() {
      _shortAnswers[_currentQuestionIndex] = answer;
    });
  }

  void _finishQuiz() {
    int correctAnswers = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_questions[i]['type'] == 'multiple_choice' ||
          _questions[i]['type'] == 'true_false') {
        if (_userAnswers[i] == _questions[i]['correctAnswer']) {
          correctAnswers++;
        }
      } else if (_questions[i]['type'] == 'short_answer') {
        if (_shortAnswers[i].trim().isNotEmpty) {
          correctAnswers++;
        }
      }
    }

    final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
    final newResult = {
      'correct': correctAnswers,
      'total': _questions.length,
      'date': formattedDate,
      'score': '$correctAnswers/${_questions.length}'
    };

    setState(() {
      _quizHistory.insert(0, newResult);
    });

    _saveQuizHistory().then((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Hasil Kuis'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Skor Anda: $correctAnswers dari ${_questions.length}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: correctAnswers / _questions.length,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    correctAnswers / _questions.length > 0.6
                        ? Colors.green
                        : Colors.orange,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _getResultMessage(correctAnswers),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _currentQuestionIndex = 0;
                  _userAnswers = List.filled(_questions.length, null);
                  _shortAnswers = List.filled(_questions.length, '');
                  for (var controller in _textControllers) {
                    controller.clear();
                  }
                });
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }).catchError((error) {
      debugPrint('Error saving history: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal menyimpan riwayat kuis')),
      );
    });
  }

  String _getResultMessage(int correctAnswers) {
    double percentage = correctAnswers / _questions.length;
    if (percentage >= 0.8) {
      return 'Sangat baik! Anda menguasai materi kebugaran jasmani dengan baik.';
    } else if (percentage >= 0.6) {
      return 'Bagus! Anda sudah memahami dasar-dasar kebugaran jasmani.';
    } else if (percentage >= 0.4) {
      return 'Cukup baik. Disarankan untuk mempelajari kembali materi.';
    } else {
      return 'Perlu belajar lebih banyak tentang kebugaran jasmani.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.orange,
        title: Text(
          'KUIS KEBUGARAN JASMANI',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RiwayatQuizPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.all(16.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LinearProgressIndicator(
                          value: (_currentQuestionIndex + 1) / _questions.length,
                          minHeight: 10,
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Soal ${_currentQuestionIndex + 1}/${_questions.length}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _questions[_currentQuestionIndex]['question'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                if (_questions[_currentQuestionIndex]['type'] == 'multiple_choice' ||
                                    _questions[_currentQuestionIndex]['type'] == 'true_false')
                                  ...List.generate(
                                    _questions[_currentQuestionIndex]['answers'].length,
                                    (index) => RadioListTile<int>(
                                      value: index,
                                      groupValue: _userAnswers[_currentQuestionIndex],
                                      onChanged: (value) {
                                        _answerQuestion(value!);
                                      },
                                      title: Text(
                                        _questions[_currentQuestionIndex]['answers'][index],
                                        style: const TextStyle(fontSize: 16),
                                        overflow: TextOverflow.visible,
                                      ),
                                      activeColor: Colors.blue[800],
                                    ),
                                  ),
                                if (_questions[_currentQuestionIndex]['type'] == 'short_answer')
                                  TextField(
                                    controller: _textControllers[_currentQuestionIndex],
                                    onChanged: _answerShortQuestion,
                                    decoration: InputDecoration(
                                      labelText: 'Jawaban Anda',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue[800]!),
                                      ),
                                    ),
                                    maxLines: 3,
                                    onTap: () {
                                      Future.delayed(const Duration(milliseconds: 300), () {
                                        _scrollController.animateTo(
                                          _scrollController.position.maxScrollExtent,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeOut,
                                        );
                                      });
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (_currentQuestionIndex > 0)
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _currentQuestionIndex--;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                  ),
                                  child: Text(
                                    'Sebelumnya',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              else
                                const SizedBox(width: 100),
                              if (_currentQuestionIndex < _questions.length - 1)
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _currentQuestionIndex++;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue[800],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text(
                                    'Berikutnya',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              else
                                ElevatedButton(
                                  onPressed: _finishQuiz,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green[600],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text(
                                    'Selesai',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}