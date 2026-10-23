import 'package:active4capk/pages/app_colors.dart';
import 'package:active4capk/pages/fitness_element.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';

class ElementPage extends StatefulWidget {
  const ElementPage({Key? key}) : super(key: key);

  @override
  _ElementPageState createState() => _ElementPageState();
}

class _ElementPageState extends State<ElementPage> {
  final FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;
  int? currentSpeakingIndex;
  bool ttsAvailable = true;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  Future<void> _initTts() async {
    try {
      await flutterTts.awaitSpeakCompletion(true);
      if (await flutterTts.isLanguageAvailable("id-ID")) {
        await flutterTts.setLanguage("id-ID");
      } else if (await flutterTts.isLanguageAvailable("en-US")) {
        await flutterTts.setLanguage("en-US");
      }
      await flutterTts.setSpeechRate(0.45);
      await flutterTts.setVolume(1.0);
      await flutterTts.setPitch(1.0);
    } catch (e) {
      print("Error inisialisasi TTS: $e");
      _showTtsInstallGuide();
    }
  }

  void _showTtsInstallGuide() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Perhatian"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Untuk pengalaman terbaik:"),
                SizedBox(height: 8),
                Text("1. Install 'Google Text-to-Speech' dari Play Store"),
                Text("2. Buka pengaturan TTS di perangkat Anda"),
                Text("3. Download bahasa Indonesia"),
                Text("4. Set Google TTS sebagai default"),
              ],
            ),
            actions: [
              TextButton(
                child: Text("Buka Play Store"),
                onPressed:
                    () => launchUrl(
                      Uri.parse(
                        "https://play.google.com/store/apps/details?id=com.google.android.tts",
                      ),
                    ),
              ),
              TextButton(
                child: Text("Tutup"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
    );
  }

  Future<void> _speak(String text, int index) async {
    if (!ttsAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Text-to-speech tidak tersedia di perangkat ini"),
        ),
      );
      return;
    }
    try {
      if (isSpeaking && currentSpeakingIndex == index) {
        await flutterTts.stop();
      } else {
        await flutterTts.stop();
        await flutterTts.speak(text);
      }
      setState(() {
        isSpeaking = !(isSpeaking && currentSpeakingIndex == index);
        currentSpeakingIndex = isSpeaking ? index : null;
      });
    } catch (e) {
      print("Error speaking: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal memutar suara: ${e.toString()}")),
      );
    }
  }

  // === BIOMOTOR ELEMENTS ===
  final List<FitnessElement> biomotorElements = [
    FitnessElement(
      title: "Kekuatan (Strength)",
      description: "Kemampuan otot dalam mengerahkan tenaga maksimal.",
      examples: [
        "• Gerakan jongkok (squat): Gerakan latihan kekuatan yang dilakukan dengan menurunkan pinggul dari posisi berdiri ke posisi jongkok, lalu kembali berdiri)",
        "• Menekan beban di atas bangku datar (bench press): Latihan kekuatan di mana seseorang berbaring di bangku datar dan menekan beban (biasanya barbel) ke atas dari dada, lalu menurunkannya kembali.",
        "• Angkat mati (deadlift): Latihan kekuatan di mana seseorang mengangkat barbel dari lantai sampai berdiri tegak, lalu menurunkannya kembali.",
      ],
      icon: Icons.fitness_center,
    ),
    FitnessElement(
      title: "Daya Tahan (Endurance)",
      description:
          "Kemampuan tubuh untuk melakukan aktivitas fisik dalam waktu lama tanpa mengalami kelelahan berlebihan.",
      examples: [
        "• Lari kecil (jogging): Lari santai dengan kecepatan sedang.",
        "• Bersepeda: Aktivitas mengayuh sepeda sebagai sarana transportasi atau olahraga.",
        "• Renang: Gerakan berpindah tempat di air dengan menggunakan anggota tubuh, terutama tangan dan kaki.",
      ],
      icon: Icons.directions_run,
    ),
    FitnessElement(
      title: "Kecepatan (Speed)",
      description: "Kemampuan tubuh untuk bergerak dalam waktu singkat.",
      examples: [
        "• Lari cepat (sprint): Lari cepat dalam waktu sesingkat mungkin.",
        "• Lari interval (interval running): Latihan lari dengan pola bergantian antara kecepatan tinggi (lari cepat) dan kecepatan rendah (jalan atau joging) dalam waktu atau jarak tertentu.",
      ],
      icon: Icons.speed,
    ),
    FitnessElement(
      title: "Kelincahan (Agility)",
      description:
          "Kemampuan tubuh untuk bergerak cepat dan mengubah arah dengan tepat.",
      examples: [
        "• Lari bolak-balik (shuttle run): Lari bolak-balik antara dua titik dalam jarak pendek. ",
        "• Latihan tangga kelincahan (ladder drill): Latihan menggunakan tangga datar di lantai. ",
        "• Latihan kerucut (cone drill): Latihan yang menggunakan kerucut (cone) sebagai rintangan atau titik arah untuk meningkatkan kelincahan, perubahan arah, dan reaksi cepat.",
      ],
      icon: Icons.directions_run,
    ),
    FitnessElement(
      title: "Kelenturan (Flexibility)",
      description:
          "Kemampuan otot dan sendi untuk melakukan gerakan dalam rentang yang luas.",
      examples: [
        "• Yoga: Latihan yang menggabungkan gerakan tubuh, pernapasan, dan meditasi untuk meningkatkan fleksibilitas dan ketenangan pikiran.",
        "• Peregangan (stretching): Peregangan otot-otot tubuh untuk meningkatkan fleksibilitas, mengurangi ketegangan otot, dan mencegah cedera.",
        "• Pemanasan dinamis (dynamic warm-up): Pemanasan aktif yang melibatkan gerakan tubuh secara terus-menerus untuk mempersiapkan otot dan sendi sebelum melakukan aktivitas fisik atau olahraga.",
      ],
      icon: Icons.self_improvement,
    ),
    FitnessElement(
      title: "Daya Ledak (Power)",
      description:
          "Kombinasi kekuatan dan kecepatan dalam mengerahkan tenaga secara maksimal dalam waktu singkat.",
      examples: [
        "• Latihan lompat ke atas kotak (box jump): Latihan melompat ke atas kotak atau permukaan yang tinggi untuk melatih kekuatan dan daya ledak otot kaki.",
        "• Lempar bola berat (medicine ball throw): Latihan melempar bola berat untuk melatih kekuatan otot tubuh bagian atas dan koordinasi.",
        "• Daya ledak otot (plyometric): Latihan yang melibatkan gerakan eksplosif seperti melompat untuk meningkatkan kekuatan, kecepatan, dan daya ledak otot.",
      ],
      icon: Icons.flash_on,
    ),
    FitnessElement(
      title: "Koordinasi (Coordination)",
      description: "Kemampuan mengontrol gerakan tubuh secara efisien.",
      examples: [
        "• Lompat tali (jump rope): Latihan lompat tali yang bermanfaat untuk meningkatkan kebugaran kardiorespirasi, koordinasi, dan kelincahan.",
        "• Latihan menangkap dan melempar (catch and throw drill): Latihan menangkap dan melempar bola yang melatih koordinasi mata dan tangan serta keterampilan motorik.",
        "• Latihan gerak kaki (footwork exercise): Latihan gerakan kaki untuk meningkatkan kecepatan, kelincahan, dan keseimbangan dalam bergerak.",
      ],
      icon: Icons.sync,
    ),
    FitnessElement(
      title: "Keseimbangan (Balance)",
      description: "Kemampuan tubuh dalam menjaga stabilitas postur.",
      examples: [
        "•	Berdiri satu kaki (one-leg stand): Latihan berdiri dengan satu kaki yang bertujuan untuk melatih keseimbangan dan stabilitas tubuh.",
        "•	Latihan menggunakan bola BOSU (bosu ball exercise): Latihan menggunakan bola BOSU (setengah bola karet di atas platform datar) untuk meningkatkan keseimbangan, koordinasi, dan kekuatan inti tubuh.",
      ],
      icon: Icons.accessibility_new,
    ),
  ];

  // === KOORDINATIF ELEMENTS ===
  final List<FitnessElement> coordinativeElements = [
    FitnessElement(
      title: "Keseimbangan Dinamis dan Statis",
      description:
          "Kemampuan tubuh untuk menjaga keseimbangan saat bergerak (dinamis) atau diam (statis).",
      examples: [
        "• Berjalan di atas balok (walking on a beam): Berjalan di atas balok keseimbangan.",
        "• Gerakan yoga (yoga poses): Gerakan atau posisi tubuh dalam yoga.",
      ],
      icon: Icons.balance,
    ),
    FitnessElement(
      title: "Kecepatan Reaksi (Reaction Time)",
      description: "Kemampuan tubuh merespons rangsangan dengan cepat.",
      examples: [
        "•	Reaksi start sprint (sprint start reaction): Reaksi atau respons saat mulai berlari cepat.",
        "•	Latihan menangkap (catch drill): Latihan khusus yang dirancang untuk meningkatkan kemampuan seseorang dalam menangkap objek, biasanya bola, dengan tepat dan cepat.",
      ],
      icon: Icons.bolt,
    ),
    FitnessElement(
      title: "Kemampuan Ritme (Rhythm Ability)",
      description: "Kemampuan untuk melakukan gerakan dengan tempo yang tepat.",
      examples: [
        "•	Lompat tali dengan pola ritme: Melompat tali sesuai dengan hitungan dan irama tertentu membantu tubuh bergerak selaras dan teratur.",
      ],
      icon: Icons.music_note,
    ),
    FitnessElement(
      title: "Ketepatan (Precision)",
      description:
          "Kemampuan dalam mengontrol gerakan untuk mencapai target tertentu.",
      examples: [
        "•	Tembakan bola basket (shooting basket): Latihan menembak bola ke ring basket dengan teknik melempar bola secara tepat dan akurat.",
        "•	Panahan (archery): Latihan memanah dengan mengarahkan anak panah ke sasaran menggunakan busur, melatih konsentrasi dan ketelitian.",
        "•	Latihan mengoper (passing drills): Latihan mengoper bola kepada teman satu tim dalam olahraga seperti sepak bola atau bola basket untuk meningkatkan kecepatan dan akurasi operan serta kerja sama tim.",
      ],
      icon: Icons.center_focus_strong,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'UNSUR KEBUGARAN JASMANI',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(isSpeaking ? Icons.volume_off : Icons.volume_up),
            onPressed: () {
              if (isSpeaking) {
                flutterTts.stop();
                setState(() {
                  isSpeaking = false;
                  currentSpeakingIndex = null;
                });
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSpeakableText(
              text: 'Unsur-unsur Kebugaran Jasmani',
              index: 0,
              textColor: textColor,
              isTitle: true,
            ),
            SizedBox(height: 8),
            _buildSpeakableText(
              text:
                  'Unsur-unsur kebugaran jasmani menurut Tudor O. Bompa. '
                  'Tudor O. Bompa, seorang ahli dalam bidang pelatihan olahraga, '
                  'mengelompokkan unsur-unsur kebugaran jasmani ke dalam dua kategori utama.',
              index: 1,
              textColor: textColor,
            ),
            SizedBox(height: 1),
            // Biomotor Abilities Section
            _buildSpeakableText(
              text: '1. Kemampuan Biomotorik (Biomotor Abilites)',
              index: 2,
              textColor: textColor,
              isTitle: true,
            ),
            SizedBox(height: 1),
            _buildSpeakableText(
              text: 'Kemampuan fisik utama yang memengaruhi performa tubuh.',
              index: 3,
              textColor: textColor,
            ),
            SizedBox(height: 5),
            ...biomotorElements.asMap().entries.map((entry) {
              final index = entry.key + 4;
              final element = entry.value;
              return Column(
                children: [
                  _buildSpeakableText(
                    text: element.title,
                    index: index,
                    textColor: AppColors.primaryColor,
                    isTitle: true,
                  ),
                  SizedBox(height: 1),
                  _buildSpeakableText(
                    text: element.description,
                    index: index + 100,
                    textColor: textColor,
                  ),
                  SizedBox(height: 1),
                  if (element.examples.isNotEmpty)
                    _buildSpeakableText(
                      text: "Contoh latihan:\n${element.examples.join('\n')}",
                      index: index + 200,
                      textColor: textColor,
                    ),
                ],
              );
            }).toList(),
            SizedBox(height: 10),

            _buildSpeakableText(
              text: '2. Kemampuan Koordinatif (Coordinative Abilities)',
              index: 300,
              textColor: textColor,
              isTitle: true,
            ),
            SizedBox(height: 1),
            _buildSpeakableText(
              text: 'Kemampuan tubuh dalam mengontrol gerakan dengan efisien.',
              index: 301,
              textColor: textColor,
            ),
            SizedBox(height: 2),
            ...coordinativeElements.asMap().entries.map((entry) {
              final index = entry.key + 302;
              final element = entry.value;
              return Column(
                children: [
                  _buildSpeakableText(
                    text: element.title,
                    index: index,
                    textColor: AppColors.primaryColor,
                    isTitle: true,
                  ),
                  SizedBox(height: 1),
                  _buildSpeakableText(
                    text: element.description,
                    index: index + 100,
                    textColor: textColor,
                  ),
                  SizedBox(height: 1),
                  if (element.examples.isNotEmpty)
                    _buildSpeakableText(
                      text: "Contoh latihan:\n${element.examples.join('\n')}",
                      index: index + 200,
                      textColor: textColor,
                    ),
                  SizedBox(height: 2),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSpeakableText({
  required String text,
  required int index,
  required Color textColor,
  bool isTitle = false,
}) {
  final defaultStyle = GoogleFonts.poppins(
    fontSize: isTitle ? 14 : 10,
    fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
    color: textColor,
  );

  TextSpan formatTextWithItalic(String text, TextStyle defaultStyle) {
    final englishWords = <String>{
      'critical',
      'biomotor',
      'abilites',
      'coordinative',
      'abilities',
      'thinking',
      'communication',
      'collaboration',
      'creativity',
      'learning',
      'project',
      'problem-based',
      'solution',
      'create',
      'feature',
      'interactive',
      'video',
      '3d',
      'quiz',
      'strength',
      'training',
      'drill',
      'flash',
      'health',
      'message',
      'home',
      'cpu',
      'play',
      'squat',
      'bench',
      'press',
      'deadlift',
      'endurance',
      'jogging',
      'speed',
      'agility',
      'shuttle',
      'run',
      'ladder',
      'cone',
      'flexibility',
      'stretching',
      'dynamic',
      'warm-up',
      'power',
      'box',
      'jump',
      'medicine',
      'ball',
      'throw',
      'plyometric',
      'coordination',
      // ignore: equal_elements_in_set
      'jump',
      'rope',
      'catch',
      'footwork',
      'balance',
      'one-leg',
      'stand',
      'bosu',
      'reaction',
      'time',
      'rhythm',
      'ability',
      'precision',
      'walking',
      'beam',
      'yoga',
      'poses',
      'sprint',
      'start',
      'archery',
      'passing',
      'drills',
    };

    final words = text.split(RegExp(r'[\s\-]+')); // pisah spasi dan strip

    final spans = <TextSpan>[];
    int currentIndex = 0;

    for (var i = 0; i < words.length; i++) {
      final word = words[i];
      final cleanWord = word.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
      final isEnglish = englishWords.contains(cleanWord);

      final startIndex = text.indexOf(word, currentIndex);
      if (startIndex > currentIndex) {
        spans.add(
          TextSpan(
            text: text.substring(currentIndex, startIndex),
            style: defaultStyle,
          ),
        );
      }

      spans.add(
        TextSpan(
          text: text.substring(startIndex, startIndex + word.length),
          style: isEnglish
              ? defaultStyle.copyWith(fontStyle: FontStyle.italic)
              : defaultStyle,
        ),
      );

      currentIndex = startIndex + word.length;
    }

    if (currentIndex < text.length) {
      spans.add(
        TextSpan(text: text.substring(currentIndex), style: defaultStyle),
      );
    }

    return TextSpan(children: spans);
  }

  return InkWell(
    onTap: () => _speak(text, index),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: currentSpeakingIndex == index
            ? Colors.orange.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (currentSpeakingIndex == index)
            Icon(Icons.volume_up, size: 16, color: Colors.orange),
          SizedBox(width: 4),
          Expanded(
            child: RichText(
              textAlign: TextAlign.justify,
              text: formatTextWithItalic(text, defaultStyle),
            ),
          ),
        ],
      ),
    ),
  );
}
}