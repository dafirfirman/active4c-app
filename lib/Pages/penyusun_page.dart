import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PenyusunPage extends StatelessWidget {
  const PenyusunPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text(
          'PROFIL PENGEMBANG',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade50, Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Developer Profile Section
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'PROFIL PENGEMBANG',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(
                            'assets/images/profile.png',
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildProfileItem(
                          Icons.person,
                          'Nama',
                          'Ira Kenyosi Br Manurung',
                        ),
                        _buildProfileItem(
                          Icons.cake,
                          'Tempat Tanggal Lahir',
                          'Simpang Empat, 22 Oktober 1998',
                        ),
                        _buildProfileItem(
                          Icons.home,
                          'Alamat',
                          'Dusun V, Desa Sipaku Area, Kec. Simpang Empat, Kab.Asahan',
                        ),
                        _buildProfileItem(
                          Icons.school,
                          'Prodi',
                          'Pendidikan Olahraga',
                        ),
                        _buildProfileItem(
                          Icons.account_balance,
                          'Instansi',
                          'Universitas Negeri Medan',
                        ),
                        // Pembimbing Section with improved layout
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Icon(Icons.supervisor_account, size: 20),
                        //       const SizedBox(width: 10),
                        //       Expanded(
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Text(
                        //               'Pembimbing',
                        //               style: GoogleFonts.poppins(
                        //                 fontSize: 12,
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //             const SizedBox(height: 4),
                        //             _buildAdvisorItem(
                        //               'Dr. Suryadi Damainik, M.Kes.',
                        //               Icons.school_outlined,
                        //             ),
                        //             _buildAdvisorItem(
                        //               'Dr. Amir Supriadi, S.pd, M.Pd.',
                        //               Icons.school_outlined,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Ira Kenyosi Br Manurung ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    'lahir pada 22 Oktober 1998 di Desa Sipaku Area, Kecamatan Simpang Empat, Kabupaten Asahan, Provinsi Sumatera Utara. Penulis menempuh pendidikan Sekolah Dasar di SD Negeri 010027 Simpang Empat pada tahun 2004–2010, kemudian melanjutkan pendidikan di SMP Negeri 2 Simpang Empat pada tahun 2010–2013. Setelah itu, penulis melanjutkan pendidikan di SMA Negeri 1 Simpang Empat, jurusan Ilmu Pengetahuan Alam (IPA), pada tahun 2013–2016. Penulis memperoleh gelar Sarjana (S1) di Universitas Negeri Medan pada Program Studi Pendidikan Jasmani, Kesehatan, dan Rekreasi pada tahun 2016–2020. Saat ini, penulis sedang menempuh pendidikan Magister (S2) di Program Pascasarjana Universitas Negeri Medan pada Program Studi Pendidikan Olahraga sejak tahun 2023 dan dijadwalkan selesai pada tahun 2025.',
                              style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildProfileItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(value, style: GoogleFonts.poppins(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
