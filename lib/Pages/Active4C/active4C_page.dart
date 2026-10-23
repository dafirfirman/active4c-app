import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:active4capk/Pages/animation_page.dart';
import 'package:active4capk/Pages/Catatan_page.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';

class Active4cPage extends StatefulWidget {
  const Active4cPage({Key? key}) : super(key: key);

  @override
  _Active4cPageState createState() => _Active4cPageState();
}

class _Active4cPageState extends State<Active4cPage> {
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    final isMediumScreen = screenWidth < 400;
    Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'KETERAMPILAN 4C',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize:
                isSmallScreen
                    ? 16
                    : isMediumScreen
                    ? 18
                    : 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
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
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeaderSection(isSmallScreen, isMediumScreen),

            // 4C Skills Cards
            _build4cSkillsSection(isSmallScreen, isMediumScreen),

            // Problem Statement
            _buildProblemStatement(isSmallScreen, isMediumScreen),

            // PBL Stages
            _buildPblStagesSection(isSmallScreen, isMediumScreen, context),

            // Notes Button
            _buildNotesButton(isSmallScreen),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(bool isSmallScreen, bool isMediumScreen) {
    return Column(
      children: [
        _buildSpeakableCard(
          title:
              '🧠 Pemahaman Konsep Model Pembelajaran yang Digunakan: Problem Based Learning (PBL)',
          content:
              'Model pembelajaran Problem-Based Learning (PBL) adalah metode belajar yang membuat siswa aktif dalam menyelesaikan masalah nyata di sekitar mereka. Dalam proses pembelajaran ini, siswa diajak untuk berdiskusi, berbagi ide, dan bekerja sama dalam kelompok untuk mencari solusi bersama. Dengan cara ini, siswa tidak hanya memahami materi pelajaran, tetapi juga mengembangkan keterampilan berpikir kritis, kreativitas, kerja sama, dan komunikasi yang baik.',
          icon: Iconsax.book,
          color: Colors.blue,
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 0,
        ),
        SizedBox(height: isSmallScreen ? 12 : 16),
        _buildSpeakableCard(
          title: '🎯 Fokus pada Keterampilan Abad 21 (4C)',
          content:
              'Di era modern saat ini, keterampilan 4C (Critical thinking, Communication, Collaboration, and Creativity) menjadi sangat penting untuk dimiliki oleh siswa agar mampu menghadapi tantangan, baik di lingkungan sekolah maupun dalam kehidupan sehari-hari. Dalam pembelajaran PJOK, keterampilan ini perlu dilatih secara berkelanjutan agar berkembang secara optimal.',
          icon: Iconsax.tick_circle,
          color: Colors.orange,
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 1,
        ),
      ],
    );
  }

  TextSpan formatTextWithItalic(String text, TextStyle defaultStyle) {
    final commonEnglishWords = <String>{
      'critical',
      'thinking',
      'communication',
      'collaboration',
      'creativity',
      'learning',
      'project',
      'problem',
      'based',
      'solution',
      'create',
      'skills',
    };

    // Split berdasarkan spasi atau tanda strip (-)
    final words = text.split(RegExp(r'[\s\-]+'));

    final spans = <TextSpan>[];
    int currentIndex = 0;

    for (var i = 0; i < words.length; i++) {
      final word = words[i];
      final cleanWord = word.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
      final isEnglish = commonEnglishWords.contains(cleanWord);

      // Cari posisi kata di text asli (untuk spasi dan strip)
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
          style:
              isEnglish
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

  Widget _build4cSkillsSection(bool isSmallScreen, bool isMediumScreen) {
    return Column(
      children: [
        SizedBox(height: isSmallScreen ? 12 : 16),
        _buildSpeakableSectionHeader(
          title: '📘 Penjelasan dan Contoh 4C',
          subtitle: '',
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 2,
        ),
        _buildSpeakableCard(
          title: '1.	Berpikir Kritis (Critical Thinking)',
          content:
              '➤ Artinya: kemampuan menciptakan ide atau gagasan baru yang bermanfaat dan menarik.\n'
              '✅ Contoh: Siswa diminta membuat latihan fisik sederhana dengan memanfaatkan alat seadanya, seperti botol bekas, kursi, tali, ember, kertas, dan lainnya.',
          icon: Iconsax.cpu,
          color: Colors.purple,
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 3,
        ),
        _buildSpeakableCard(
          title: '2.	Kreativitas (Creativity)',
          content:
              '➤ Kemampuan menciptakan ide atau gagasan baru yang bermanfaat dan menarik.\n'
              '✅ Contoh: Kamu diminta membuat latihan fisik sederhana menggunakan alat seadanya, misalnya botol bekas, kursi, tali, ember, kertas, dan lainnya.',
          icon: Iconsax.lamp,
          color: Colors.orange,
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 4,
        ),
        _buildSpeakableCard(
          title: '3.	Kolaborasi (Collaboration)',
          content:
              '➤ Artinya: kemampuan bekerja sama dengan orang lain untuk mencapai tujuan bersama.\n'
              '✅ Contoh: Siswa bekerja sama dengan teman dalam kelompok untuk merancang dan mempraktikkan latihan kebugaran.',
          icon: Iconsax.people,
          color: Colors.teal,
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 5,
        ),
        _buildSpeakableCard(
          title: '4.	Komunikasi (Communication)',
          content:
              '➤ Artinya: kemampuan menyampaikan ide atau pendapat dengan jelas, baik secara lisan maupun tulisan.\n'
              '✅Contoh: Siswa menjelaskan latihan fisik yang telah dibuat kepada kelompok lain dengan percaya diri dan mudah dipahami.',
          icon: Iconsax.message,
          color: Colors.blue,
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 6,
        ),
      ],
    );
  }

  Widget _buildProblemStatement(bool isSmallScreen, bool isMediumScreen) {
    return Column(
      children: [
        SizedBox(height: isSmallScreen ? 12 : 16),
        _buildSpeakableProblemStatement(
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 7,
        ),
      ],
    );
  }

  Widget _buildPblStagesSection(
    bool isSmallScreen,
    bool isMediumScreen,
    BuildContext context,
  ) {
    return Column(
      children: [
        SizedBox(height: isSmallScreen ? 12 : 16),
        _buildSpeakableSectionHeader(
          title: '📘 Tahapan PBL dan Penerapan 4C',
          subtitle: '',
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 8,
        ),
        _buildSpeakableProjectStage(
          stageNumber: 1,
          title: 'Tahap Orientasi dan Pertanyaan Pemantik',
          duration: 'Waktu: Jam Pelajaran (JP) 1 – di dalam kelas',
          objective:
              'Siswa diajak mengenali masalah gaya hidup pasif dan mulai mencari solusi secara bersama-sama.',
          activities: [
            'Diskusi pertanyaan pemantik: " Mengapa penting bagi kita untuk tetap aktif bergerak, meskipun tidak memiliki alat olahraga atau tempat khusus?"→ Di sini, siswa dapat menyampaikan pendapatnya dan mendengarkan pendapat teman lain. Kegiatan ini melatih kemampuan komunikasi dan berpikir kritis."',
            'Siswa menuliskan beberapa contoh gaya hidup pasif di sekitarnya, misalnya terlalu lama duduk bermain HP, malas bergerak, atau jarang berolahraga.',
            'Siswa menonton video animasi 3D yang menampilkan contoh gerakan kebugaran jasmani. Dalam video, siswa akan melihat contoh latihan dari 4 komponen kebugaran, yaitu: Kecepatan, Kelincahan, Keseimbangan dan Koordinasi ',
            'Video ini akan membantu siswa memahami setiap gerakan serta memberikan ide untuk membuat latihan baru.',
          ],
          skill: 'Critical thinking and Communication',
          color: Colors.purple,
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 9,
        ),
        _buildVideoSection(
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          context: context,
        ),
        _buildSpeakableProjectStage(
          stageNumber: 2,
          title: 'Tahap Perencanaan Proyek',
          duration: 'Waktu: Masih di JP 1 – di lapangan atau halaman sekolah',
          objective:
              'Siswa mulai merancang latihan kebugaran jasmani secara kreatif bersama kelompoknya.',
          activities: [
            'Siswa dibagi ke dalam kelompok kecil (6–8 orang).',
            'Setiap kelompok merancang satu variasi latihan baru untuk masing-masing komponen: Kecepatan: misalnya lari cepat bolak-balik sejauh tertentu, 	Kelincahan: misalnya zig-zag menghindari botol bekas, Keseimbangan: misalnya berdiri dengan satu kaki, Koordinasi: misalnya lempar-tangkap bola kecil ke dinding',
            'Kelompok boleh menggunakan alat sederhana seperti botol bekas, kursi, tali, ember, kertas, dan lainnya.',
            'Setiap kelompok menuliskan dan menjelaskan rancangan latihannya di LKPD yang sudah disiapkan.',
          ],
          skill: 'Creativity',
          color: Colors.orange,
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 10,
        ),
        _buildSpeakableProjectStage(
          stageNumber: 3,
          title: 'Tahap Pelaksanaan',
          duration: 'Waktu: JP 2 dan JP 3 – di lapangan atau halaman sekolah',
          objective:
              'Siswa mempraktikkan latihan dan menjelaskan hasil rancangan kepada kelompok lain.',
          activities: [
            'Setiap kelompok menampilkan dan mempraktikkan empat latihan kebugaran yang telah dibuat.',
            'Perwakilan kelompok menjelaskan: Nama Latihan, Alat yang digunakan, Cara melakukannya',
            'Kelompok lain dapat memberikan pertanyaan atau tanggapan positif.',
          ],
          skill: 'Communication',
          color: Colors.blue,
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 11,
        ),
        _buildSpeakableProjectStage(
          stageNumber: 4,
          title: 'Tahap Refleksi dan Penilaian Akhir',
          duration: 'Waktu: Akhir JP 3 – kembali ke kelas',
          objective:
              'Siswa merefleksikan pengalaman belajar dan mengembangkan sikap saling menghargai dalam kerja kelompok.',
          activities: [
            'Siswa duduk membentuk lingkaran bersama kelompoknya.',
            'Secara bergiliran, setiap siswa: Menyebutkan satu hal yang paling berkesan dari kerja kelompok, Memberikan apresiasi kepada salah satu anggota kelompoknya (contoh: “Saya berterima kasih kepada Dinda karena dia membantu membuat alat latihan dengan sabar”).',
            "Diskusikan bersama dengan pertanyaan pemantik, seperti:“Apa tantangan terbesar yang kelompokmu hadapi?”,	“Apa yang membuat kerja sama kelompokmu berhasil?”",
          ],
          skill: 'Collaboration',
          color: Colors.teal,
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          index: 12,
        ),
      ],
    );
  }

  Widget _buildNotesButton(bool isSmallScreen) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isSmallScreen ? 16 : 24),
      child: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotesPage()),
            );
          },
          icon: const Icon(Iconsax.note_add),
          label: Text(
            'Buat Catatan',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 24 : 32,
              vertical: isSmallScreen ? 12 : 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
          ),
        ),
      ),
    );
  }

  Widget _buildSpeakableCard({
    required String title,
    required String content,
    required IconData icon,
    required Color color,
    required bool isSmallScreen,
    required bool isMediumScreen,
    required int index,
  }) {
    return InkWell(
      onTap: () => _speak('$title. $content', index),
      child: Card(
        margin: EdgeInsets.only(bottom: isSmallScreen ? 8 : 12),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:
                currentSpeakingIndex == index ? color.withOpacity(0.1) : null,
          ),
          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, size: 20, color: color),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: RichText(
                                text: formatTextWithItalic(
                                  title,
                                  GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isSmallScreen ? 14 : 12,
                                    color: color,
                                  ),
                                ),
                              ),
                            ),
                            if (currentSpeakingIndex == index)
                              Icon(
                                Icons.volume_up,
                                size: 16,
                                color: Colors.orange,
                              ),
                          ],
                        ),
                        SizedBox(height: 6),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: formatTextWithItalic(
                            content,
                            GoogleFonts.poppins(
                              fontSize: isSmallScreen ? 12 : 10,
                              color: const Color.fromARGB(255, 255, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpeakableSectionHeader({
    required String title,
    required String subtitle,
    required bool isSmallScreen,
    required bool isMediumScreen,
    required int index,
  }) {
    return InkWell(
      onTap: () => _speak('$title. $subtitle', index),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color:
              currentSpeakingIndex == index
                  ? Colors.orange.withOpacity(0.1)
                  : null,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: formatTextWithItalic(
                      title,
                      GoogleFonts.poppins(
                        fontSize: isSmallScreen ? 16 : 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[800],
                      ),
                    ),
                  ),
                ),

                if (currentSpeakingIndex == index)
                  Icon(Icons.volume_up, size: 16, color: Colors.orange),
              ],
            ),
            SizedBox(height: 4),
            Divider(height: 1, thickness: 1, color: Colors.grey[300]),
          ],
        ),
      ),
    );
  }

  Widget _buildSpeakableProblemStatement({
    required bool isSmallScreen,
    required bool isMediumScreen,
    required int index,
  }) {
    final text =
        'Saat ini, banyak siswa, termasuk kamu, menjadi kurang aktif bergerak karena terlalu sering menggunakan HP atau duduk terlalu lama. Padahal, tubuh kita membutuhkan aktivitas fisik agar tetap sehat dan bugar. Dalam pelajaran PJOK ini, kamu akan diajak untuk menemukan cara seru dan kreatif agar tetap aktif, meskipun dengan alat dan tempat yang terbatas.';

    return InkWell(
      onTap: () => _speak(text, index),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        decoration: BoxDecoration(
          color:
              currentSpeakingIndex == index ? Colors.red[100] : Colors.red[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red[100]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Iconsax.warning_2, color: Colors.red[600], size: 20),
                SizedBox(width: 8),
                Text(
                  'Masalah Nyata',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 14 : 12,
                    color: Colors.red[800],
                  ),
                ),
                Spacer(),
                if (currentSpeakingIndex == index)
                  Icon(Icons.volume_up, size: 16, color: Colors.orange),
              ],
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: isSmallScreen ? 12 : 10,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpeakableProjectStage({
    required int stageNumber,
    required String title,
    required String duration,
    required String objective,
    required List<String> activities,
    required String skill,
    required Color color,
    required bool isSmallScreen,
    required bool isMediumScreen,
    required int index,
  }) {
    return InkWell(
      onTap:
          () => _speak(
            'Tahap $stageNumber: $title. $duration. $objective. ${activities.join('. ')}',
            index,
          ),
      child: Card(
        margin: EdgeInsets.only(bottom: isSmallScreen ? 12 : 16),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:
                currentSpeakingIndex == index ? color.withOpacity(0.1) : null,
          ),
          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        stageNumber.toString(),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                title,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: isSmallScreen ? 14 : 12,
                                ),
                              ),
                            ),
                            if (currentSpeakingIndex == index)
                              Icon(
                                Icons.volume_up,
                                size: 16,
                                color: Colors.orange,
                              ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          duration,
                          style: GoogleFonts.poppins(
                            fontSize: isSmallScreen ? 12 : 10,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: RichText(
                            text: formatTextWithItalic(
                              skill,
                              GoogleFonts.poppins(
                                fontSize: isSmallScreen ? 11 : 10,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                'Tujuan:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallScreen ? 13 : 14,
                ),
              ),
              SizedBox(height: 4),
              Text(
                objective,
                style: GoogleFonts.poppins(fontSize: isSmallScreen ? 12 : 10),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 12),
              Text(
                'Kegiatan:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallScreen ? 13 : 14,
                ),
              ),
              SizedBox(height: 8),
              ...activities
                  .map(
                    (activity) => Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.circle, size: 6, color: color),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              activity,
                              style: GoogleFonts.poppins(
                                fontSize: isSmallScreen ? 12 : 10,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoSection({
    required bool isSmallScreen,
    required bool isMediumScreen,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnimationPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        height: isSmallScreen ? 160 : 200,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.video, size: 40, color: Colors.grey[500]),
                  SizedBox(height: 8),
                  Text(
                    'VIDEO ANIMASI - TAP TO PLAY',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: isSmallScreen ? 12 : 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Icon(Iconsax.play, size: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
