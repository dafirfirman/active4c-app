import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);
  TextSpan formatTextWithItalic(String text, TextStyle defaultStyle) {
    final englishWords = <String>{
      'critical',
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final cardColor = isDarkMode ? Colors.grey[850]! : Colors.white;
    final primaryColor = Colors.orange;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.orange,
        title: Text(
          'PETUNJUK APLIKASI',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isSmallScreen ? 14 : 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:
                isDarkMode
                    ? [Colors.grey[900]!, Colors.grey[800]!]
                    : [Colors.orange[50]!, Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeroCard(
                title: 'Tentang Aplikasi',
                description:
                    'Active 4C adalah aplikasi pembelajaran kebugaran jasmani berbasis multimedia interaktif yang dirancang khusus untuk siswa kelas VIII SMP. Aplikasi ini bertujuan untuk meningkatkan keterampilan 4C (Critical thinking, Communication, Collaboration, and Creativity) melalui aktivitas fisik yang menyenangkan, menantang, dan bermakna. Aplikasi ini mendukung pembelajaran PJOK dengan pendekatan yang modern, interaktif, dan mudah diakses baik di sekolah maupun di rumah.',
                icon: Iconsax.home_hashtag,
                color: Colors.teal,
                cardColor: cardColor,
                isDarkMode: isDarkMode,
                isSmallScreen: isSmallScreen,
              ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0),

              SizedBox(height: isSmallScreen ? 12 : 16),

              _buildSectionHeader(
                title: 'Fitur Utama',
                icon: Iconsax.flash,
                color: primaryColor,
                isSmallScreen: isSmallScreen,
              ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0),

              SizedBox(height: isSmallScreen ? 8 : 12),
              _buildHeroCard(
                title: 'Belajar Kebugaran Jasmani',
                description:
                    'Menyediakan berbagai latihan kebugaran jasmani yang dikemas secara menarik dan sesuai dengan kebutuhan siswa kelas VIII SMP. Setiap aktivitas dirancang untuk mengembangkan kecepatan, kelincahan, keseimbangan, dan koordinasi melalui gerakan yang menyenangkan dan terstruktur.',
                icon: Iconsax.health,
                color: Colors.teal,
                cardColor: cardColor,
                isDarkMode: isDarkMode,
                isSmallScreen: isSmallScreen,
              ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0),
              SizedBox(height: isSmallScreen ? 8 : 12),
              _buildHeroCard(
                title: 'Penguatan Keterampilan 4C',
                description:
                    'Setiap aktivitas dirancang untuk menstimulasi keterampilan abad ke-21 yaitu : Critical thinking, Creativity, Collaboration and Communication. ',
                icon: Iconsax.cpu,
                color: Colors.teal,
                cardColor: cardColor,
                isDarkMode: isDarkMode,
                isSmallScreen: isSmallScreen,
              ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0),
              SizedBox(height: isSmallScreen ? 8 : 12),
              _buildHeroCard(
                title: 'Kuis Interaktif',
                description:
                    'Menguji pemahaman siswa terhadap konsep kebugaran jasmani dan penerapan keterampilan 4C.',
                icon: Iconsax.message_question,
                color: Colors.teal,
                cardColor: cardColor,
                isDarkMode: isDarkMode,
                isSmallScreen: isSmallScreen,
              ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0),
              SizedBox(height: isSmallScreen ? 8 : 12),
              _buildHeroCard(
                title: 'Video 3D',
                description:
                    'Materi disajikan dalam bentuk animasi dan video 3D.',
                icon: Iconsax.video_play,
                color: Colors.teal,
                cardColor: cardColor,
                isDarkMode: isDarkMode,
                isSmallScreen: isSmallScreen,
              ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0),

              SizedBox(height: isSmallScreen ? 12 : 16),

              _buildSectionHeader(
                title: 'Kontak Kami',
                icon: Iconsax.message_text,
                color: Colors.blue,
                isSmallScreen: isSmallScreen,
              ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0),

              SizedBox(height: isSmallScreen ? 8 : 12),

              _buildContactCard(
                content:
                    'Jika Anda memiliki pertanyaan atau membutuhkan bantuan, hubungi kami melalui:',
                email: 'manurungactive4c@gmail.com',
                color: Colors.blue,
                cardColor: cardColor,
                isDarkMode: isDarkMode,
                isSmallScreen: isSmallScreen,
              ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0),

              SizedBox(height: isSmallScreen ? 16 : 24),

              Center(
                child: Column(
                  children: [
                    Text(
                      'Terima kasih telah menggunakan Active4C',
                      style: GoogleFonts.poppins(
                        fontSize: isSmallScreen ? 12 : 14,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white70 : Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '© 2025 Active4C. All Rights Reserved',
                      style: GoogleFonts.poppins(
                        fontSize: isSmallScreen ? 10 : 12,
                        color: isDarkMode ? Colors.white60 : Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1, end: 0),

              SizedBox(height: isSmallScreen ? 12 : 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required Color cardColor,
    required bool isDarkMode,
    required bool isSmallScreen,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: cardColor,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(isSmallScreen ? 10 : 12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    size: isSmallScreen ? 20 : 24,
                    color: color,
                  ),
                ),
                SizedBox(width: isSmallScreen ? 12 : 16),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: isSmallScreen ? 16 : 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: isSmallScreen ? 8 : 12),
            RichText(
  text: formatTextWithItalic(
    description,
    GoogleFonts.poppins(
      fontSize: isSmallScreen ? 12 : 12,
      color: isDarkMode ? Colors.white70 : Colors.grey[700],
      height: 1.4,
    ),
  ),
  textAlign: TextAlign.justify,
),

          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required IconData icon,
    required Color color,
    required bool isSmallScreen,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: isSmallScreen ? 18 : 20, color: color),
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: isSmallScreen ? 16 : 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard({
    required String content,
    required String email,
    required Color color,
    required Color cardColor,
    required bool isDarkMode,
    required bool isSmallScreen,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: cardColor,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content,
              style: GoogleFonts.poppins(
                fontSize: isSmallScreen ? 12 : 14,
                color: isDarkMode ? Colors.white70 : Colors.grey[700],
                height: 1.4,
              ),
            ),
            SizedBox(height: isSmallScreen ? 8 : 12),
            Row(
              children: [
                Icon(Iconsax.sms, size: isSmallScreen ? 18 : 20, color: color),
                SizedBox(width: 8),
                Text(
                  email,
                  style: GoogleFonts.poppins(
                    fontSize: isSmallScreen ? 12 : 14,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureItem {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}
