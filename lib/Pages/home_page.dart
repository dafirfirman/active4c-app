import 'package:active4capk/Pages/penyusun_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:active4capk/Pages/active4C/active4C_page.dart';
import 'package:active4capk/Pages/element_page.dart';
import 'package:active4capk/Pages/informasi_page.dart';
import 'package:active4capk/Pages/pengertian_page.dart';
import 'package:active4capk/Pages/petunjuk_page.dart';

class HomePage extends StatefulWidget {
  final Function(ThemeMode) changeTheme;

  const HomePage({super.key, required this.changeTheme});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<String> carouselImages = [
    'assets/images/gambar1.png',
    'assets/images/gambar2.jpg',
    'assets/images/gambar3.png',
    'assets/images/gambar4.png',
    'assets/images/gambar5.png',
  ];

  ThemeMode _currentThemeMode = ThemeMode.system;
  final PageController _liquidController = PageController();
  int _currentCarouselIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _liquidController.dispose();
    super.dispose();
  }

  void _toggleTheme() {
    setState(() {
      _currentThemeMode =
          _currentThemeMode == ThemeMode.dark
              ? ThemeMode.light
              : ThemeMode.dark;
      widget.changeTheme(_currentThemeMode);
    });
  }

  bool get _isDarkMode {
    final brightness = MediaQuery.of(context).platformBrightness;
    return _currentThemeMode == ThemeMode.system
        ? brightness == Brightness.dark
        : _currentThemeMode == ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Active4C',
          style: GoogleFonts.wallpoet(
            fontSize: isSmallScreen ? 22 : 26,
            fontWeight: FontWeight.w900,
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,

        actions: [
          IconButton(
            icon: Icon(
              _isDarkMode ? Iconsax.sun_1 : Iconsax.moon,
              color: _isDarkMode ? Colors.amber : Colors.indigo,
            ),
            onPressed: _toggleTheme,
          ),
          IconButton(
            icon: Icon(Iconsax.info_circle, size: isSmallScreen ? 22 : 26),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InformationPage()),
              );
            },
          ),
          // New IconButton for PenyusunPage
          IconButton(
            icon: Icon(Iconsax.personalcard, size: isSmallScreen ? 22 : 26),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PenyusunPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Carousel
            Container(
              height: isSmallScreen ? 180 : 220,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: PageView.builder(
                  itemCount: carouselImages.length,
                  controller: _liquidController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      carouselImages[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            _buildCarouselIndicator(),

            // Welcome Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.orange.shade100.withOpacity(0.8),
                      Colors.orange.shade50.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Selamat Datang!',
                      style: GoogleFonts.poppins(
                        fontSize: isSmallScreen ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Temukan berbagai materi pembelajaran kebugaran jasmani yang interaktif dan menyenangkan',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: isSmallScreen ? 14 : 16,
                        color: Colors.grey.shade800,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade700,
                        foregroundColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 24 : 32,
                          vertical: isSmallScreen ? 12 : 14,
                        ),
                        shadowColor: Colors.orange.withOpacity(0.3),
                      ),
                      child: Text(
                        'Mulai Belajar',
                        style: GoogleFonts.poppins(
                          fontSize: isSmallScreen ? 15 : 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Learning Materials Section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Materi Pembelajaran',
                        style: GoogleFonts.poppins(
                          fontSize: isSmallScreen ? 20 : 22,
                          fontWeight: FontWeight.bold,
                          color: _isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Iconsax.book_1,
                        color: Colors.orange.shade700,
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildLearningMaterials(colors, isSmallScreen),
                ],
              ),
            ),

            // Quiz Section
          ],
        ),
      ),
    );
  }

  Widget _buildLearningMaterials(ColorScheme colors, bool isSmallScreen) {
    final learningItems = [
      {
        'icon': Iconsax.health,
        'label': 'Kebugaran Jasmani',
        'page': PengertianPage(),
        'color': Colors.orange.shade700,
        'gradient': [Colors.orange.shade400, Colors.orange.shade700],
      },
      {
        'icon': Iconsax.element_4,
        'label': 'Unsur-unsur Kebugaran',
        'page': ElementPage(),
        'color': Colors.blue.shade700,
        'gradient': [Colors.blue.shade400, Colors.blue.shade700],
      },
      {
        'icon': Iconsax.cpu,
        'label': 'Keterampilan 4C',
        'page': Active4cPage(),
        'color': Colors.purple.shade700,
        'gradient': [Colors.purple.shade400, Colors.purple.shade700],
      },
      {
        'icon': Iconsax.message_question,
        'label': 'Kuis',
        'page': InstructionPage(),
        'color': Colors.purple.shade700,
        'gradient': [
          const Color.fromARGB(255, 71, 188, 77),
          const Color.fromARGB(255, 14, 158, 50),
        ],
      },
    ];

    return Column(
      children:
          learningItems.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 4,
                child: InkWell(
                  onTap: () => _navigateToCategory(item['page'] as Widget),
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: item['gradient'] as List<Color>,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -30,
                          top: -30,
                          child: Icon(
                            item['icon'] as IconData,
                            size: 120,
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                item['icon'] as IconData,
                                size: 30,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  item['label'] as String,
                                  style: GoogleFonts.poppins(
                                    fontSize: isSmallScreen ? 16 : 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Icon(
                                Iconsax.arrow_right_3,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        carouselImages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: _currentCarouselIndex == index ? 20 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color:
                _currentCarouselIndex == index
                    ? Colors.orange.shade700
                    : Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  void _navigateToCategory(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
