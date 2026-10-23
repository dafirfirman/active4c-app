import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(home: PengertianPage()));
}

class PengertianPage extends StatefulWidget {
  const PengertianPage({Key? key}) : super(key: key);

  @override
  _PengertianPageState createState() => _PengertianPageState();
}

class _PengertianPageState extends State<PengertianPage> {
  final FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;
  int? currentSpeakingIndex;

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
      var engines = await flutterTts.getEngines;
      var languages = await flutterTts.getLanguages;

      if (engines.any((e) => e.toLowerCase().contains('google'))) {
        await flutterTts.setEngine("com.google.android.tts");
      }

      String? indonesianLanguage;
      List<String> preferredLanguages = ['id-ID', 'ind-ID', 'id', 'ind'];

      for (var lang in languages ?? []) {
        if (preferredLanguages.any((pref) => lang.toLowerCase().contains(pref.toLowerCase()))) {
          indonesianLanguage = lang;
          break;
        }
      }

      if (indonesianLanguage != null) {
        await flutterTts.setLanguage(indonesianLanguage);
      } else if (languages?.contains('en-US') ?? false) {
        await flutterTts.setLanguage('en-US');
      } else if (languages?.isNotEmpty ?? false) {
        await flutterTts.setLanguage(languages!.first);
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
      builder: (context) => AlertDialog(
        title: const Text("Perhatian"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
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
            child: const Text("Buka Play Store"),
            onPressed: () => launchUrl(
              Uri.parse("https://play.google.com/store/apps/details?id=com.google.android.tts"),
            ),
          ),
          TextButton(
            child: const Text("Tutup"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Future<void> _speak(String text, int index) async {
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

  Widget hangingIndentText({
    required String text,
    required int index,
    required Color color,
    required bool isTitle,
  }) {
    return InkWell(
      onTap: () => _speak(text, index),
      child: RichText(
        textAlign: isTitle ? TextAlign.left : TextAlign.justify,
        text: TextSpan(
          style: GoogleFonts.poppins(
            fontSize: isTitle ? 16 : 10,
            fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
            color: color,
            height: 1.5,
          ),
          children: [
            if (!isTitle) const WidgetSpan(child: SizedBox(width: 30)),
            TextSpan(text: text),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'KEBUGARAN JASMANI',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
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
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hangingIndentText(
                text: 'Pengertian Kebugaran Jasmani',
                index: 0,
                color: textColor,
                isTitle: true,
              ),
              const SizedBox(height: 16),
              hangingIndentText(
                text:
                    'Kebugaran jasmani adalah kemampuan tubuh dalam melakukan aktivitas fisik tanpa mengalami kelelahan yang berlebihan dan tetap memiliki cadangan energi untuk beraktivitas sehari-hari. Menurut Tudor Ο. Bompa (1999) kebugaran jasmani adalah kemampuan seseorang untuk melakukan aktivitas fisik secara optimal, efisien, dan tanpa mengalami kelelahan yang berlebihan, serta melakukan pemulihan cepat setelah aktivitas fisik. Menurut Rusli Lutan (2001) menyatakan bahwa kebugaran jasmani adalah kemampuan seseorang untuk menyesuaikan diri terhadap berbagai aktivitas fisik yang dilakukan dengan beban kerja tertentu tanpa mengalami kelelahan yang berlebihan. Sementara itu, Muhajir (2007), kebugaran jasmani adalah kemampuan seseorang untuk menjalankan tugas sehari-hari tanpa menimbulkan kelelahan yang berarti dan masih memiliki cadangan tenaga untuk melakukan kegiatan lain.',
                index: 1,
                color: textColor,
                isTitle: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
