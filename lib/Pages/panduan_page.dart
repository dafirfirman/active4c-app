import 'package:flutter/material.dart';

class PanduanSwimproPage extends StatelessWidget {
  const PanduanSwimproPage({Key? key}) : super(key: key);

  bool _isEnglishWord(String word) {
    final englishWords = {
      'relax',
      'float',
      'confidence',
      'swim',
      'goggles',
      'earplugs',
      'irritation',
      'chlorine',
      'pool',
      'visibility',
      'underwater',
      'gradual',
      'training',
      'shallow',
      'deep',
      'instructor',
      'beginner',
      'safe',
      'warm-up',
      'panic',
      'tension',
      'body',
      'water',
      'technique',
      'practice',
      'adaptation',
      'survival',
      'tips',
      'tricks',
      'touch',
      'scroll',
      'pause',
      'reset',
      'password',
      'login',
      'register',
      'install',
      'android',
      'app',
      'application',
      'feature',
      'menu',
      'material',
      'learning',
      'style',
      'breaststroke',
      'freestyle',
    };
    return englishWords.contains(word.toLowerCase());
  }

  Widget _buildTextWithEnglishItalic(String text) {
    final words = text.split(' ');
    final spans = <TextSpan>[];

    for (var word in words) {
      final cleanWord = word.replaceAll(RegExp(r'[^\w\s-]'), '');
      spans.add(
        TextSpan(
          text: '$word ',
          style: _isEnglishWord(cleanWord)
              ? const TextStyle(fontStyle: FontStyle.italic)
              : null,
        ),
      );
    }

    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        children: spans,
      ),
      textAlign: TextAlign.justify,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panduan Samudra Swimpro'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section A: Spesifikasi Produk
            _buildSectionHeader('A. SPESIFIKASI PRODUK'),
            _buildTextWithEnglishItalic(
              'Aplikasi Samudra Swimpro merupakan media pembelajaran PJOK pada materi pembelajaran renang berbasis Android. Sistem operasi android dipilih karena merupakan sistem operasi yang diciptakan untuk program open source, sehingga developer dapat melakukan pengembangan terhadap aplikasi yang dibuatnya. '
              'Aplikasi Samudra Swimpro berisi Materi pembelajaran renang gaya dada dan renang gaya bebas pada pembelajaran PJOK yang dikhusukan bagi jenjang SMP. Materi pembelajaran yang ada di dalam aplikasi Samudra Swimpro merupakan pembelajaran untuk kelas 10, 11, 12 yang disesuaikan dengan bahan ajar kurikulum 2013 dan Kurikulum Merdeka Belajar jenjang SMP. '
              'Di dalamnya terdapat peta konsep, materi ajar, serta evaluasi yang memuat tentang rubrik penilaian. Samudra Swimpro dibuat guna menjadi tambahan sebagai sumber belajar mata pelajaran PJOK yang mudah diakses kapanpun dan dimanapun melalui gadget para siswa. Sehingga diharapkan mempermudah guru dan siswa dalam belajar dan menyampaikan materi pembelajaran PJOK. Aplikasi Swimpro dapat digunakan pada ponsel android dengan versi sebagai berikut:',
            ),
            const SizedBox(height: 8),
            Text(
              'Spesifikasi Android yang didukung:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            _buildBulletItem('Android 6.0 Marshmallow'),
            _buildBulletItem('Android 5.0 Lollipop'),
            _buildBulletItem('Android 7.0 Nougat'),
            _buildBulletItem('Android 8.0 Oreo'),
            _buildBulletItem('Android 9.0 Pie'),
            _buildBulletItem('Android 10'),

            const Divider(height: 40),

            // Section B: Instalasi dengan Gambar
            _buildSectionHeader('B. INSTALASI'),
            _buildStepWithImage(
              context,
              1,
              'Untuk memperoleh aplikasi ini, pengguna dapat mengunduhnya di Google Play Store dengan keyword "Samudra Swimpro". Lalu klik tombol instal',
              'assets/img/logo.png',
            ),
            _buildStepWithImage(
              context,
              2,
              'Silakan buka folder, dimana hasil download tersimpan pada ponsel Anda. Kemudian klik icon aplikasi tersebut untuk menginstal.',
              'assets/img/logo.png',
            ),
            _buildStepWithImage(
              context,
              3,
              'Kemudian akan muncul toolbox dan pilih "Installer Paket"',
              'assets/img/logo.png',
            ),
            _buildStepWithImage(
              context,
              4,
              'Lanjutkan dengan memilih "Instal" untuk melanjutkan instal aplikasi',
              'assets/img/logo.png',
            ),
            _buildStepWithImage(
              context,
              5,
              'Tunggu hingga aplikasi selesai terinstal, kemudian klik "Selesai" untuk mengakhiri. Aplikasi Samudra Swimpro siap untuk digunakan.',
              'assets/img/logo.png',
            ),

            const Divider(height: 40),

            // Section C: Registrasi Akun dengan Gambar
            _buildSectionHeader('C. REGISTRASI AKUN'),
            _buildTextWithEnglishItalic(
              'Menu awal merupakan tampilan pertama yang muncul ketika pengguna membuka aplikasi. Halaman ini dirancang dengan antarmuka yang intuitif dan ramah pengguna agar memudahkan navigasi. Menu ini berfungsi sebagai gerbang utama menuju fitur-fitur dalam aplikasi dan menyediakan beberapa opsi penting yaitu:',
            ),
            _buildStepWithImage(
              context,
              1,
              'Klik icon aplikasi Samudra Swimpro untuk membuka aplikasi',
              'assets/img/logo.png',
            ),
            _buildNumberedItem(2,
                'Bagi pengguna baru yang belum memiliki akun, mereka dapat memilih opsi daftar akun Register.'),
            _buildNumberedItem(3,
                'Setelah mengklik tombol Register, pengguna akan diarahkan ke halaman registrasi'),
            _buildNumberedItem(4,
                'Setelah mengisi data dengan benar dan mengklik tombol Register'),
            _buildStepWithImage(
              context,
              5,
              'Jika pendaftaran berhasil, pengguna dapat langsung masuk menggunakan akun yang baru dibuat',
              'assets/img/panduan2.jpg',
            ),

            const Divider(height: 40),

            // Section D: Menu Login dengan Gambar
            _buildSectionHeader('D. MENU LOGIN'),
            _buildTextWithEnglishItalic(
              'Ketika pengguna membuka aplikasi, maka akan terdapat 3 menu awal untuk memulai eksplorasi pengguna di dalam aplikasi yaitu start atau login, panduan pengguna, dan reset password:',
            ),
            _buildNumberedItem(1,
                'Jika pengguna sudah memiliki akun atau sudah berhasil melakukan registrasi, anda dapat memilih tombol masuk untuk diarahkan ke halaman login'),
            _buildNumberedItem(2,
                'Pada halaman ini, pengguna diminta memasukkan email atau nama pengguna (username) serta kata sandi yang telah didaftarkan'),
            _buildStepWithImage(
              context,
              3,
              'Setelah berhasil masuk, pengguna akan diarahkan ke halaman utama aplikasi untuk mengakses berbagai fitur yang tersedia',
              'assets/img/panduan1.jpg',
            ),

            const Divider(height: 40),

            // Section E: Reset Password
            _buildSectionHeader('E. RESET PASSWORD'),
            _buildTextWithEnglishItalic(
              'Jika pengguna mengalami kesulitan masuk karena lupa kata sandi, aplikasi menyediakan fitur lupa password atau reset password. '
              'Dengan memilih opsi ini, pengguna akan diarahkan ke halaman pemulihan akun, di mana anda dapat memasukkan email yang terdaftar. '
              'Sistem kemudian akan mengirimkan tautan atau kode verifikasi ke email pengguna untuk melakukan reset password.',
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/img/panduan3.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tampilan halaman reset password',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // Section F: Petunjuk Penggunaan
            _buildSectionHeader('F. PETUNJUK PENGGUNAAN'),
            _buildStepWithImage(
              context,
              1,
              'Tampilan menu utama klik pilihan materi yang anda kehendaki',
              'assets/img/home.jpg',
            ),
            _buildStepWithTwoImages(
              context,
              2,
              'Setelah memilih materi pembelajaran maka anda akan masuk ke menu materi, silakan memilih materi yang sesuai atau kehendaki.',
              'assets/img/gayadada.jpg',
              'assets/img/gayabebas.jpg',
            ),
            _buildStepWithTwoImages(
              context,
              3,
              'Pada menu ini berisi tentang materi bahan ajar yang telah Anda pilih. Untuk melanjutkan membaca dan mempelajari, anda bisa melakukan scroll ke bawah pada layar ponsel anda',
              'assets/img/pengertian1.jpg',
              'assets/img/pengertian2.jpg',
            ),
            _buildNumberedItem(4,
                'Jika sudah selesai mempelajari materi pertama atau pembelajaran yang anda inginkan anda bisa klik gambar ikon anak panah atau klik tombol navigasi di android anda untuk kembali ke halaman pembelajaran berikutnya'),

            const Divider(height: 40),

            // Section G: Interaksi Pengguna
            _buildSectionHeader('G. INTERAKSI PENGGUNA'),
            _buildTextWithEnglishItalic(
              'Untuk mengoperasikan aplikasi Samudra Swimpro, pengguna dapat menggunakan beberapa fitur navigasi berikut:',
            ),
            _buildFeatureItem(Icons.touch_app, 'Sentuh (Touch)',
                'Pengguna dapat menyentuh layar smartphone untuk memilih menu utama, mengakses materi pembelajaran, serta membuka gambar yang terdapat dalam materi.'),
            _buildFeatureItem(Icons.swipe, 'Gulir (Scroll)',
                'Saat membaca materi pembelajaran, pengguna dapat menggulir layar ke atas atau ke bawah untuk melanjutkan atau mengulang bagian tertentu sesuai kebutuhan.'),
            _buildFeatureItem(Icons.pause, 'Jeda (Pause)',
                'Saat menonton video tutorial renang, pengguna dapat menghentikan sementara (pause), mempercepat, atau memperlambat durasi video guna memahami lebih jelas setiap gerakan yang diperagakan dalam tayangan.'),

            const SizedBox(height: 30),
            Center(
              child: Text(
                'Selamat Menggunakan Aplikasi Samudra Swimpro!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue[800],
        ),
      ),
    );
  }

  Widget _buildNumberedItem(int number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: _buildTextWithEnglishItalic(text),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• '),
          Expanded(child: _buildTextWithEnglishItalic(text)),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[800]),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: title.split(' (')[0]),
              TextSpan(
                text: ' (${title.split(' (')[1]}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: _buildTextWithEnglishItalic(subtitle),
      ),
    );
  }

  Widget _buildStepWithImage(
      BuildContext context, int number, String text, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$number. ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: _buildTextWithEnglishItalic(text),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 24.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStepWithTwoImages(
      BuildContext context, int number, String text, String imagePath1, String imagePath2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$number. ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: _buildTextWithEnglishItalic(text),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 24.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          imagePath1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          imagePath2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Gaya Dada (kiri) dan Gaya Bebas (kanan)',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}