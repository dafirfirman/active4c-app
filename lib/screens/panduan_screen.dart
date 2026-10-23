import 'package:flutter/material.dart';

class PanduanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Panduan Aplikasi Active 4C",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Title
            Text(
              "SPESIFIKASI PRODUK",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Description about the application (ubah jadi RichText)
            RichText(
              textAlign: TextAlign.justify,
              text: formatTextWithItalic(
                "Aplikasi Active 4C merupakan media pembelajaran PJOK pada materi kebugaran jasmani berbasis multimedia interaktif yang dikembangkan untuk meningkatkan keterampilan abad 21 (4C), yaitu critical thinking, communication, collaboration, and creativity pada siswa SMP. Sistem operasi Android dipilih karena merupakan sistem operasi yang dirancang sebagai program sumber terbuka, sehingga pengembang dapat melakukan pengembangan terhadap aplikasi yang dibuat. Aplikasi Active 4C berisi materi pembelajaran kebugaran jasmani yang difokuskan untuk siswa kelas VIII SMP. Materi disajikan dalam bentuk multimedia interaktif yang disesuaikan dengan bahan ajar Kurikulum 2013 dan Kurikulum Merdeka Belajar. Di dalamnya terdapat peta konsep, materi ajar berbasis video animasi, latihan aktivitas fisik, serta quiz. Active 4C dibuat sebagai sumber belajar tambahan untuk mata pelajaran PJOK yang dapat diakses dengan mudah kapan saja dan di mana saja melalui gawai (perangkat elektronik) milik siswa. Dengan demikian, aplikasi ini diharapkan dapat mempermudah guru dan siswa dalam proses pembelajaran serta penyampaian materi PJOK secara lebih menarik, aktif, dan bermakna.",
                TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),

            // List of supported Android versions
            Text(
              "Aplikasi Active 4C dapat digunakan pada ponsel Android dengan versi sebagai berikut:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVersionItem("1. Android 6.0 Marshmallow"),
                _buildVersionItem("2. Android 5.0 Lollipop"),
                _buildVersionItem("3. Android 7.0 Nougat"),
                _buildVersionItem("4. Android 8.0 Oreo"),
                _buildVersionItem("5. Android 9.0 Pie"),
                _buildVersionItem("6. Android 10"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each version item
  Widget _buildVersionItem(String version) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          SizedBox(width: 8),
          Text(version, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  TextSpan formatTextWithItalic(String text, TextStyle defaultStyle) {
    final englishWords = <String>{
      'critical', 'thinking',
      'communication', 'collaboration', 'creativity',
      'video', 'animasi',
      'quiz', 'smartphone',
    };

    final words = text.split(RegExp(r'[\s\.,;:\-\(\)]+')); // split by spaces and punctuation

    final spans = <TextSpan>[];
    int currentIndex = 0;

    for (var word in words) {
      if (word.isEmpty) continue;
      final cleanWord = word.toLowerCase();
      final isEnglish = englishWords.contains(cleanWord);

      final startIndex = text.indexOf(word, currentIndex);
      if (startIndex > currentIndex) {
        spans.add(TextSpan(
            text: text.substring(currentIndex, startIndex),
            style: defaultStyle));
      }

      spans.add(TextSpan(
          text: text.substring(startIndex, startIndex + word.length),
          style: isEnglish
              ? defaultStyle.copyWith(fontStyle: FontStyle.italic)
              : defaultStyle));

      currentIndex = startIndex + word.length;
    }

    if (currentIndex < text.length) {
      spans.add(TextSpan(
          text: text.substring(currentIndex, text.length), style: defaultStyle));
    }

    return TextSpan(children: spans);
  }
}
