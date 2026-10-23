import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  // Define all video categories with complete videos
  final List<VideoCategory> kategoriVideo = [
    VideoCategory(
      name: 'Kecepatan',
      videos: [
        VideoItem(
          path: 'assets/videos/animation1.mp4',
          judul: 'Berbelok-belok (Zigzag)',
          deskripsi:
              'Berbelok-belok adalah gerakan berlari sambil berbelok-belok ke kanan dan kiri secara cepat. Gerakan ini dimulai dengan berdiri tegak, lalu berlari ke depan sambil belok ke kanan melewati rintangan pertama, lanjut belok ke kiri melewati rintangan berikutnya. Ulangi gerakan belok kanan dan kiri hingga garis akhir.',
        ),
        VideoItem(
          path: 'assets/videos/animation2.mp4',
          judul: 'Langkah dua kaki ke depan (Lateral Double Step)',
          deskripsi:
              'Langkah dua kaki ke depan adalah gerakan melompat ke depan dengan cepat menggunakan kedua kaki secara bersamaan. Gerakan tersebut berdiri dengan kaki rapat, lalu lakukan lompatan ke depan melewati beberapa cone yang telah disusun. Setelah itu, lanjutkan dengan berlari cepat.',
        ),
        VideoItem(
          path: 'assets/videos/animation3.mp4',
          judul: 'Lompat tarik lutut dengan satu kaki (Tuck Jump Satu Kaki)',
          deskripsi:
              'Lompat tarik lutut dengan satu kaki adalah gerakan melompat menggunakan satu kaki sambil menarik lutut kaki yang satunya ke arah dada saat di udara. Gerakan ini dimulai dengan berdiri dengan satu kaki, kaki lainnya diangkat kearah dada, lalu lompat sampai garis selesai.',
        ),
        VideoItem(
          path: 'assets/videos/animation4.mp4',
          judul: 'Gerakan masuk dan keluar secara menyamping (Lateral In Out)',
          deskripsi:
              'Gerakan masuk dan keluar secara menyamping adalah gerakan berpindah kaki ke samping dengan cepat, seperti masuk ke dalam garis lalu keluar dari luar garis secara bergantian. Gerakan ini dimulai dengan berdiri tegak dengan kaki rapat, lalu langkahkan kaki kanan ke samping kanan (keluar garis), kemudian kaki kiri kesamping kiri (keluar garis). Setelah itu, langkahkan kaki kanan ke dalam garis lalu kaki kiri juga pada garis.',
        ),
        VideoItem(
          path: 'assets/videos/animation5.mp4',
          judul: 'Lari berbalik punggung (Back to Back Run)',
          deskripsi:
              'Lari berbalik punggung adalah gerakan lari maju dan mundur dengan posisi punggung mengarah ke belakang. Gerakan ini dimulai dengan posisi berdiri tegak di garis mulai. Selanjutnya, berlari ke arah kiri menuju depan cone kedua. Setelah itu, lari mundur memutari cone pertama menuju cone ketiga. Kemudian, lari mundur kembali memutari bagian belakang cone kedua, dan dilanjutkan dengan berlari ke arah garis akhir.',
        ),
        VideoItem(
          path: 'assets/videos/animation6.mp4',
          judul: 'Lari berbalik punggung 4 cone (Back to Back Run 4 Cone)',
          deskripsi:
              'Lari berbalik punggung empat cone adalah gerakan lari cepat bolak-balik melewati empat cone yang disusun sejajar, dengan arah lari yang bergantian antara maju dan mundur. Gerakan ini dimulai dari cone pertama, lari cepat ke cone kedua lalu mundur ke cone pertama, lanjut ke cone ketiga lalu mundur kembali, dan terakhir ke cone keempat lalu mundur lagi ke titik awal.',
        ),
        VideoItem(
          path: 'assets/videos/animation7.mp4',
          judul:
              'Gerakan lutut tinggi ke depan dengan satu kaki tumpuan (Lateral High Knee Satu Kaki)',
          deskripsi:
              'Gerakan lutut tinggi ke depan dengan satu kaki tumpuan adalah latihan yang dilakukan dengan cara mengangkat kaki setinggi lutut sambil melompat ke depan menggunakan satu kaki sebagai tumpuan. Gerakan ini dimulai dengan berdiri tegak di garis mulai. Selanjutnya, angkat kaki kiri setinggi lutut dengan posisi sedikit ke arah belakang. Kemudian, kaki kanan melakukan gerakan melompat ke depan, melewati cone yang telah disusun secara berurutan.',
        ),
        VideoItem(
          path: 'assets/videos/animation8.mp4',
          judul: 'Latihan kekuatan (Strength Training)',
          deskripsi:
              'Latihan kekuatan adalah gerakan untuk melatih otot tubuh bagian bawah. Gerakan ini dimulai dengan berdiri tegak di garis mulai. Selanjutnya melompat melewati cone pertama, lalu buka kedua kaki saat mendarat dan lakukan gerakan jongkok. Setelah itu, berdiri kembali, rapatkan kedua kaki, lalu lanjutkan dengan melompat ke cone berikutnya. Ulangi pola gerakan ini hingga mencapai titik akhir.',
        ),
        VideoItem(
          path: 'assets/videos/animation9.mp4',
          judul: 'Gerakan berbelok-belok mundur (Zigzag Back)',
          deskripsi:
              'Gerakan berbelok-belok mundur adalah gerakan berlari mundur secara zigzag melewati cone yang telah disusun. Gerakan ini dimulai dengan posisi berdiri tegak di sisi kiri cone pertama. Kemudian, berlari mundur secara zigzag ke arah kanan dan kiri melewati cone-cone berikutnya. Setelah melewati cone keempat, berbalik badan dan berlari ke garis akhir.',
        ),
        VideoItem(
          path: 'assets/videos/animation10.mp4',
          judul: 'Gerakan lutut tinggi ke samping (Lateral High Knee)',
          deskripsi:
              'Gerakan kaki setinggi lutut ke samping adalah gerakan mengangkat kaki setinggi lutut setinggi mungkin sambil bergerak menyamping secara bergantian. Gerakan ini dimulai dengan posisi berdiri menghadap ke samping, sejajar dengan cone pertama. Lompat ke cone pertama dengan menghentakkan kaki dua kali secara cepat. Kemudian, lompat ke cone berikutnya dengan gerakan yang sama. Setelah itu, berbalik ke depan dan lanjutkan berlari menuju garis akhir.',
        ),
      ],
    ),

    VideoCategory(
      name: 'Kelincahan',
      videos: [
        VideoItem(
          path: 'assets/videos/kelincahan1.mp4',
          judul: 'Langkah masuk dan keluar (In-out Step)',
          deskripsi:
              'Langkah masuk dan keluar adalah gerakan kaki yang dilakukan dengan cepat, yaitu melangkah masuk dan keluar kaki ke dalam garis berbentuk lingkaran secara berulang. Gerakan ini dimulai dengan berdiri di depan lingkaran. Langkahkan kaki kanan masuk ke dalam lingkaran sementara kaki kiri tetap di luar. Selanjutnya, langkahkan kaki kiri masuk ke dalam lingkaran dan kaki kanan keluar. Ulangi gerakan ini secara cepat dan terus-menerus.',
        ),
        VideoItem(
          path: 'assets/videos/kelincahan2.mp4',
          judul: 'Langkah gunting (Scissors Step)',
          deskripsi:
              'Langkah gunting adalah gerakan menyilang kaki ke depan dan belakang secara bergantian, menyerupai gerakan membuka dan menutup gunting. Gerakan ini dimulai dengan posisi berdiri tegak, satu kaki di depan dan satu kaki di belakang. Kemudian, lakukan lompatan kecil sambil menukar posisi kaki: kaki depan berpindah ke belakang dan kaki belakang ke depan. Ulangi gerakan ini secara berulang.',
        ),
        VideoItem(
          path: 'assets/videos/kelincahan3.mp4',
          judul: 'Lompatan lingkaran/garis depan (Hoop Jump/Front Line)',
          deskripsi:
              'Lompatan lingkaran atau garis depan adalah gerakan melompat masuk dan keluar dari lingkaran secara berulang. Gerakan ini dimulai dengan berdiri di belakang lingkaran. Selanjutnya, lakukan lompatan masuk ke dalam lingkaran dengan kedua kaki mendarat bersamaan. Setelah itu, lanjutkan dengan melompat keluar, lalu kembali melompat masuk ke dalam lingkaran secara bergantian.',
        ),
        VideoItem(
          path: 'assets/videos/kelincahan4.mp4',
          judul: 'Lompatan lingkaran/garis samping (Hoop Jump/Side Line)',
          deskripsi:
              'Lompatan lingkaran atau garis samping adalah gerakan melompat ke arah samping melewati lingkaran (hula hoop) atau garis yang disusun menyamping. Gerakan ini dimulai dengan posisi berdiri di sisi luar lingkaran atau garis pertama. Lompat ke samping masuk ke dalam lingkaran atau melewati garis dengan kedua kaki mendarat bersamaan. Ulangi gerakan ini hingga semua lingkaran atau garis terlewati.',
        ),
        VideoItem(
          path: 'assets/videos/kelincahan8.mp4',
          judul: 'Lari berbelok-belok (Zigzag Run)',
          deskripsi:
              'Lari berbelok-belok adalah gerakan lari cepat yang dilakukan dengan arah berbelok ke kanan dan kiri secara bergantian melewati rintangan atau tanda. Gerakan ini dimulai dengan menyusun beberapa cone atau penanda secara berjejer membentuk jalur zigzag. Berdirilah di titik awal, lalu berlari dengan cepat mengikuti jalur berbelok ke kanan dan kiri hingga mencapai garis akhir.',
        ),
        VideoItem(
          path: 'assets/videos/kelincahan9.mp4',
          judul: 'Lari V (V-Run)',
          deskripsi:
              'Lari V adalah gerakan lari yang membentuk pola huruf "V", dilakukan dengan bergerak menyebar ke sisi kanan dan kiri, kemudian kembali ke titik awal secara cepat. Gerakan ini dimulai dengan membuat tiga titik penanda berbentuk huruf "V" (satu titik di depan dan dua titik di kanan dan kiri agak ke belakang). Mulailah dari titik depan, kemudian lari menyebar ke sisi kanan. Setelah itu, kembali ke titik depan dan lanjutkan dengan berlari ke sisi kiri.',
        ),
        VideoItem(
          path: 'assets/videos/kelincahan10.mp4',
          judul: 'Lari bolak-balik (Shuttle Run)',
          deskripsi:
              'Lari bolak-balik adalah gerakan lari cepat dari satu titik ke titik lainnya secara berulang dalam jarak pendek. Gerakan ini dimulai dengan menandai dua titik berjarak kurang lebih 5-10 meter. Berdirilah di tengah antara kedua titik tersebut. Kemudian, berlarilah secepat mungkin menuju titik di sebelah kanan, sentuh garis atau cone, lalu segera berbalik dan berlari ke arah titik di sebelah kiri. Ulangi gerakan ini sesuai jumlah pengulangan yang telah ditentukan.',
        ),
      ],
    ),

    VideoCategory(
      name: 'Keseimbangan',
      videos: [
        VideoItem(
          path: 'assets/videos/keseimbangan5.mp4',
          judul: 'Gerakan pesawat terbang',
          deskripsi:
              'Gerakan pesawat terbang adalah latihan keseimbangan tubuh dengan posisi berdiri menggunakan satu kaki, sementara kaki lainnya diangkat ke belakang dan kedua tangan direntangkan ke kanan dan kiri seperti sayap pesawat. Gerakan ini dimulai dengan berdiri tegak, lalu angkat satu kaki ke belakang sambil mencondongkan badan ke depan. Rentangkan kedua tangan ke samping setinggi bahu. Tahan posisi ini selama beberapa detik, lalu ganti menggunakan kaki yang satunya.',
        ),
        VideoItem(
          path: 'assets/videos/keseimbangan4.mp4',
          judul: 'Sikap tubuh berdiri seperti pohon (Standing Tree Pose)',
          deskripsi:
              'Sikap tubuh berdiri seperti pohon adalah latihan keseimbangan dengan berdiri menggunakan satu kaki, sementara kaki lainnya ditempelkan pada bagian paha atau betis kaki penopang. Kedua tangan diangkat ke atas dan dibuka membentuk huruf "V" menyerupai ranting pohon. Gerakan ini dimulai dengan berdiri tegak, kemudian angkat satu kaki dan tempelkan telapak kakinya pada bagian paha atau betis kaki yang menopang. Angkat kedua tangan ke atas dan buka ke samping membentuk huruf "V". Condongkan tubuh sedikit ke kiri dan ke kanan seperti ranting yang tertiup angin. Jaga posisi tubuh tetap tegak dan arahkan pandangan lurus ke depan. Tahan posisi ini selama beberapa detik, lalu ganti kaki.',
        ),
        VideoItem(
          path: 'assets/videos/keseimbangan2.mp4',
          judul:
              'Posisi tumpuan tubuh lurus dengan angkat tangan atau kaki (Plank With Hand/Leg Lifts)',
          deskripsi:
              'Posisi ini merupakan latihan keseimbangan dan kekuatan dengan menahan tubuh dalam posisi plank, lalu mengangkat satu tangan atau satu kaki secara bergantian. Gerakan dimulai dengan posisi plank, yaitu tangan dan ujung kaki sebagai tumpuan, tubuh lurus dari kepala hingga tumit. Angkat satu tangan ke depan sejajar bahu, tahan beberapa detik, lalu turunkan. Selanjutnya, angkat satu kaki ke belakang sejajar dengan tubuh, tahan, lalu turunkan kembali. Lakukan secara bergantian dengan kontrol penuh, pastikan pinggul tidak turun atau terangkat berlebihan.',
        ),
        VideoItem(
          path: 'assets/videos/keseimbangan3.mp4',
          judul: 'Sikap Lilin',
          deskripsi:
              'Sikap lilin adalah gerakan keseimbangan tubuh dalam posisi terbalik, di mana tubuh bagian atas disangga oleh bahu dan tangan, sedangkan kaki lurus ke atas membentuk garis vertikal seperti lilin. Gerakan ini dimulai dengan berbaring telentang, lalu angkat kaki dan pinggul ke atas secara perlahan hingga tubuh membentuk garis lurus dari bahu hingga ujung kaki. Tangan menopang punggung bawah untuk menjaga keseimbangan. Tahan posisi ini selama beberapa detik, lalu turunkan kaki perlahan ke posisi awal.',
        ),
        VideoItem(
          path: 'assets/videos/keseimbangan1.mp4',
          judul:
              'Jongkok satu kaki dengan kaki lainnya lurus ke depan (Pistol Squat)',
          deskripsi:
              'Jongkok satu kaki atau pistol squat adalah latihan keseimbangan dan kekuatan dengan posisi jongkok menggunakan satu kaki, sedangkan kaki lainnya diluruskan ke depan sejajar lantai. Gerakan dimulai dengan berdiri tegak menggunakan satu kaki, lalu angkat kaki yang satunya lurus ke depan. Perlahan, tekuk lutut kaki penopang dan turunkan badan ke posisi jongkok sedalam mungkin tanpa menyentuhkan kaki lurus ke lantai. Pastikan punggung tetap tegak dan kedua tangan direntangkan ke depan untuk membantu keseimbangan. Setelah menahan posisi sejenak, dorong tubuh kembali ke posisi berdiri.',
        ),
      ],
    ),

    VideoCategory(
      name: 'Koordinasi',
      videos: [
        VideoItem(
          path: 'assets/videos/koordinasi1.mp4',
          judul: 'Latihan berulang-ulang kecil/pendek (Drill kecil/pendek)',
          deskripsi:
              'Latihan berulang-ulang kecil/pendek adalah latihan gerakan mengangkat kaki setinggi mata kaki yang dilakukan secara berulang-ulang. Gerakan ini dimulai dengan berdiri tegak, mengangkat kaki kanan menggunakan telapak kaki setinggi mata kaki kemudian mengangkat kaki kiri setinggi mata kaki dengan posisi tangan di gerakan ke atas dan bawah. ulangi gerakan tersebut secara berulang dan cepat.',
        ),
        VideoItem(
          path: 'assets/videos/koordinasi2.mp4',
          judul: 'Latihan berulang-ulang kecil ½ (Drill kecil ½)',
          deskripsi:
              'Latihan mengangkat kaki secara bergantian dengan gerakan cepat dan ritmis. Gerakan dimulai dengan berdiri tegak, kemudian angkat kaki kanan ke depan setinggi lutut atau sedikit di bawahnya, bertumpu pada ujung telapak kaki. Lanjutkan dengan kaki kiri secara bergantian. Kedua tangan diayunkan ke atas dan ke bawah mengikuti irama kaki. Latihan ini dilakukan secara cepat dan berulang.',
        ),
        VideoItem(
          path: 'assets/videos/koordinasi3.mp4',
          judul: 'Angkat paha minimal rata-rata air',
          deskripsi:
              'Angkat paha minimal rata-rata air adalah latihan mengangkat kaki setinggi lutut pada saat bergerak. Gerakan ini dimulai dengan berdiri tegak lalu angkat kaki kanan setinggi lutut ke depan lalu turunkan. Ulangi gerakan dengan kaki yang lain secara bergantian.',
        ),
        VideoItem(
          path: 'assets/videos/koordinasi4.mp4',
          judul: 'Putar kaki sampai tumit menyentuh area pinggul bawah',
          deskripsi:
              'Putar kaki sampai tumit menyentuh area pinggul bawah adalah untuk melatih koordinasi dan fleksibilitas yang dilakukan dengan cara bergantian. Gerakan ini dilakukan dengan cara berdiri tegak, lalu mengangkat salah satu kaki ke belakang hingga tumit mendekati atau menyentuh area pinggul bagian bawah, sambil menjaga tubuh tetap seimbang; setelah itu, kaki diturunkan kembali secara perlahan dan gerakan diulang dengan kaki yang satunya secara bergantian.',
        ),
        VideoItem(
          path: 'assets/videos/koordinasi5.mp4',
          judul:
              'Mengayun Kaki Lurus ke Depan dengan Tumpuan Ujung Telapak Kaki',
          deskripsi:
              'Mengayun kaki lurus ke depan dengan tumpuan ujung telapak kaki adalah latihan dengan mengayunkan kaki lurus ke depan sambil bertumpu pada ujung telapak kaki satunya. Gerakan ini dilakukan dengan cara mengayunkan satu kaki lurus ke depan sambil bertumpu pada ujung telapak kaki yang lainnya. Gerakan dimulai dari posisi berdiri tegak, dengan tubuh bertumpu pada ujung telapak kaki kiri. Selanjutnya, ayunkan kaki kanan lurus ke depan setinggi mungkin. Pastikan kaki tetap lurus dan posisi punggung tetap tegak (tidak membungkuk). Setelah itu, lakukan gerakan yang sama secara bergantian dengan kaki yang satunya. Gerakan ini diiringi dengan ayunan tangan secara dinamis, mengikuti irama gerakan kaki, naik dan turun secara seimbang.',
        ),
        VideoItem(
          path: 'assets/videos/koordinasi6.mp4',
          judul: 'Bonding Drill',
          deskripsi:
              'Bonding drill adalah latihan gerakan dinamis yang dilakukan dengan cara mengangkat kaki hingga hampir setinggi secara bergantian dan berulang-ulang. Gerakan ini dimulai dari posisi berdiri tegak, kemudian kaki kanan diangkat hampir setinggi lutut menggunakan telapak kaki, diikuti oleh kaki kiri dengan tinggi angkatan yang sama. Posisi tangan digerakkan naik turun mengikuti irama langkah kaki. Latihan ini dilakukan secara cepat dan ritmis.',
        ),
        VideoItem(
          path: 'assets/videos/koordinasi7.mp4',
          judul: 'Kijang (paha sampai rata-rata air)',
          deskripsi:
              'Kijang (paha sampai rata-rata air) adalah latihan berlari kemudian melompati seperti kijang Gerakan ini dimulai dengan berdiri tegak, kemudian berlari, lalu berlari seperti melompat dengan badan menjorok kedepan serta kaki yang diangkat setinggi lutut. Ulangi dengan kaki yang lain secara bergantian.',
        ),
        VideoItem(
          path: 'assets/videos/koordinasi8.mp4',
          judul: 'Loncatan bertenaga (Skip Power)',
          deskripsi:
              'Latihan ini melibatkan gerakan melompat dengan tenaga penuh sambil mengangkat kaki setinggi lutut secara bergantian. Gerakan dimulai dari posisi berdiri tegak. Angkat kaki kanan setinggi lutut, kemudian turunkan dan lanjutkan dengan mengangkat kaki kiri setinggi lutut. Ulangi gerakan tersebut secara bergantian. Gerakan kaki ini diiringi dengan ayunan tangan ke atas dan ke bawah secara ritmis untuk melatih koordinasi dan keseimbangan tubuh.',
        ),
        VideoItem(
          path: 'assets/videos/koordinasi9.mp4',
          judul: 'Latihan kecepatan jarak pendek (Drill Speed Pendek)',
          deskripsi:
              'Latihan kecepatan jarak pendek adalah bentuk latihan lari cepat yang dilakukan dalam jarak pendek sekitar 10 hingga 20 meter. Gerakan ini dimulai dari posisi siap, kemudian pelari berlari secepat mungkin dengan langkah eksplosif dan postur tubuh condong ke depan. Lengan diayunkan kuat dan kaki diangkat tinggi untuk mendukung kecepatan maksimal. Setelah mencapai jarak yang ditentukan, pelari dapat berhenti atau berjalan perlahan untuk pemulihan. Latihan ini dilakukan berulang kali dengan istirahat yang cukup antar setiap repetisi.',
        ),
        VideoItem(
          path: 'assets/videos/koordinasi10.mp4',
          judul:
              'Latihan kecepatan untuk otot paha belakang (Drill Speed Hamstring)',
          deskripsi:
              'Latihan ini bertujuan untuk meningkatkan kekuatan dan kecepatan otot paha belakang. Gerakan dimulai dari posisi siap, kemudian badan dibungkukkan sedikit ke depan, kaki sedikit ditekuk, dan kedua tangan dijulurkan ke depan. Selanjutnya, lakukan gerakan lari dengan menghentakkan kedua kaki secara bergantian ke arah depan. Latihan dilakukan dalam jarak pendek, sekitar 10-20 meter, dengan jeda istirahat yang cukup.',
        ),
        VideoItem(
          path: 'assets/videos/koordinasi11.mp4',
          judul: 'Daya ledak kecepatan (Speed Power)',
          deskripsi:
              'Daya ledak kecepatan adalah kemampuan tubuh untuk bergerak cepat dengan tenaga penuh dalam waktu singkat. Latihan ini dilakukan dengan cara berlari menggunakan kekuatan maksimal dalam jarak pendek, misalnya lari sejauh 10-20 meter dengan tenaga penuh. Fokus utama adalah pada gerakan yang cepat, kuat, dan eksplosif.',
        ),
      ],
    ),
  ];
  TextSpan formatTextWithItalic(String text, TextStyle defaultStyle) {
    // Daftar kata bahasa Inggris yang ingin dimiringkan (bisa dikembangkan)
    final englishWords = <String>{
      'zigzag',
      'lateral',
      'double',
      'step',
      'tuck',
      'jump',
      'in',
      'out',
      'back',
      'run',
      'cone',
      'high',
      'knee',
      'strength',
      'training',
      'drill',
      'scissors',
      'hoop',
      'front',
      'line',
      'side',
      'shuttle',
      // ignore: equal_elements_in_set
      'run',
      'plank',
      'pose',
      // ignore: equal_elements_in_set
      'plank',
      'squat',
      'juggling',
      'cross',
      'crawl',
      'ball',
      'wall',
      'foot',
      'eye',
      'coordination',
      'plyometric',
      'dance',
      'steps',
      'multitask',
      'reaction',
      // ignore: equal_elements_in_set
      'training',
      'advanced',
      'bonding',
      'skip',
      'power',
      'speed',
      'hamstring',
    };

    final words = text.split(RegExp(r'[\s\-]+')); // split by space or dash

    final spans = <TextSpan>[];
    int currentIndex = 0;

    for (var i = 0; i < words.length; i++) {
      final word = words[i];
      final cleanWord = word.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
      final isEnglish = englishWords.contains(cleanWord);

      // Cari posisi kata di string asli supaya tanda baca dan spasi tetap ada
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

  int kategoriTerpilih = 0;
  int videoTerpilih = 0;
  FlickManager? pengelolaVideo;
  bool sedangMemuat = true;
  String? pesanError;

  // Contoh video overlay (misal kamera kecil)
  bool overlayActive = true;

  @override
  void initState() {
    super.initState();
    _muatVideo(0, 0);
  }

  Future<void> _muatVideo(int kategoriIndex, int videoIndex) async {
    if (!mounted) return;

    setState(() {
      sedangMemuat = true;
      pesanError = null;
    });

    try {
      await pengelolaVideo?.dispose();

      final path = kategoriVideo[kategoriIndex].videos[videoIndex].path;
      final controller = VideoPlayerController.asset(path);
      await controller.initialize().timeout(const Duration(seconds: 5));

      if (mounted) {
        setState(() {
          pengelolaVideo = FlickManager(
            videoPlayerController: controller,
            autoPlay: false,
          );
          kategoriTerpilih = kategoriIndex;
          videoTerpilih = videoIndex;
          sedangMemuat = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          pesanError = "Gagal memuat video. Pastikan file video tersedia";
          sedangMemuat = false;
        });
      }
    }
  }

  @override
  void dispose() {
    pengelolaVideo?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: Text(
          'VIDEO ANIMASI',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Video player with proper null checks
            AspectRatio(
              aspectRatio:
                  pengelolaVideo
                      ?.flickVideoManager
                      ?.videoPlayerController
                      ?.value
                      .aspectRatio ??
                  16 / 9,
              child: _tampilkanPemutarVideo(),
            ),

            const SizedBox(height: 16),

            // Judul & deskripsi with null checks
            if (kategoriVideo.isNotEmpty &&
                kategoriVideo.length > kategoriTerpilih)
              RichText(
                text: formatTextWithItalic(
                  kategoriVideo[kategoriTerpilih].videos[videoTerpilih].judul,
                  GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                ),
              ),

            const SizedBox(height: 8),

            if (kategoriVideo.isNotEmpty &&
                kategoriVideo.length > kategoriTerpilih)
              RichText(
                text: formatTextWithItalic(
                  kategoriVideo[kategoriTerpilih]
                      .videos[videoTerpilih]
                      .deskripsi,
                  const TextStyle(fontSize: 12, color: Colors.black87),
                ),
                textAlign: TextAlign.justify,
              ),

            const SizedBox(height: 16),

            // Pilihan kategori horizontal
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: kategoriVideo.length,
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ChoiceChip(
                        label: Text(kategoriVideo[index].name),
                        selected: kategoriTerpilih == index,
                        selectedColor: Colors.orange[300],
                        onSelected: (selected) {
                          if (selected) {
                            setState(() {
                              kategoriTerpilih = index;
                              videoTerpilih = 0;
                            });
                            _muatVideo(index, 0);
                          }
                        },
                      ),
                    ),
              ),
            ),

            const SizedBox(height: 16),

            // List video kategori terpilih with null checks
            if (kategoriVideo.isNotEmpty &&
                kategoriVideo.length > kategoriTerpilih)
              ...List.generate(kategoriVideo[kategoriTerpilih].videos.length, (
                index,
              ) {
                final video = kategoriVideo[kategoriTerpilih].videos[index];
                final isSelected = index == videoTerpilih;
                return Card(
                  color: isSelected ? Colors.orange[50] : null,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      child: Text('${index + 1}'),
                    ),
                    title: RichText(
                      text: formatTextWithItalic(
                        video.judul,
                        GoogleFonts.poppins(
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color:
                              isSelected
                                  ? Colors.orange[800]
                                  : const Color.fromARGB(221, 255, 0, 0),
                        ),
                      ),
                    ),
                    onTap: () => _muatVideo(kategoriTerpilih, index),
                  ),
                );
              }),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _tampilkanPemutarVideo() {
    if (sedangMemuat) {
      return const Center(child: CircularProgressIndicator());
    }
    if (pesanError != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 40),
            const SizedBox(height: 10),
            Text(
              pesanError!,
              style: GoogleFonts.poppins(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _muatVideo(kategoriTerpilih, videoTerpilih),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: Text(
                'Coba Lagi',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }
    if (pengelolaVideo == null) {
      return const Center(child: Text("Player tidak tersedia"));
    }

    return FlickVideoPlayer(
      flickManager: pengelolaVideo!,
      flickVideoWithControls: const FlickVideoWithControls(
        controls: FlickPortraitControls(),
      ),
    );
  }
}

class VideoCategory {
  final String name;
  final List<VideoItem> videos;

  VideoCategory({required this.name, required this.videos});
}

class VideoItem {
  final String path;
  final String judul;
  final String deskripsi;

  VideoItem({required this.path, required this.judul, required this.deskripsi});
}
