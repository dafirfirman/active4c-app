import 'package:flutter/material.dart';

class LupaPasswordScreen extends StatefulWidget {
  @override
  _LupaPasswordScreenState createState() => _LupaPasswordScreenState();
}

class _LupaPasswordScreenState extends State<LupaPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  void _resetPassword() {
    if (_emailController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      // Tambahkan logika untuk mereset password di sini, misalnya menghubungi API
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _isLoading = false;
        });
        // Menampilkan pesan berhasil atau gagal
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Informasi", style: TextStyle(fontWeight: FontWeight.bold)),
            content: Text("Kami telah mengirimkan email reset password."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ],
          ),
        );
      });
    } else {
      // Jika email kosong, tampilkan pesan kesalahan
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Peringatan", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text("Harap masukkan email yang valid."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Lupa Kata Sandi", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_reset,
              size: 100,
              color: const Color.fromARGB(255, 255, 0, 0),
            ),
            SizedBox(height: 30),
            Text(
              "Masukkan surel Anda untuk mengatur ulang kata sandi.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Surel",
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.email, color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : ElevatedButton(
                    onPressed: _resetPassword,
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    ),
                    child: Text(
                      "Kirim Permintaan mengatur ulang kata sandi",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
