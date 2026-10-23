import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  TextEditingController _noteController = TextEditingController();
  List<String> _savedNotes = [];

  @override
  void initState() {
    super.initState();
    _loadSavedNotes();
  }

  // Fungsi untuk memuat catatan yang disimpan
  _loadSavedNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedNotes = prefs.getStringList('notes') ?? [];
    });
  }

  // Fungsi untuk menyimpan catatan
  _saveNote() async {
    if (_noteController.text.isEmpty) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    _savedNotes.add(_noteController.text);
    await prefs.setStringList('notes', _savedNotes);
    setState(() {});
    _noteController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Catatan berhasil disimpan!')),
    );
  }

  // Fungsi untuk menghapus catatan
  _deleteNote(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _savedNotes.removeAt(index);
    await prefs.setStringList('notes', _savedNotes);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'CATATAN',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true, // Menghindari overflow saat keyboard muncul
      body: SingleChildScrollView( // Membungkus body dalam SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tulis Catatan Anda:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _noteController,
                maxLines: 10, // Batas baris maksimum
                decoration: const InputDecoration(
                  hintText: 'Masukkan catatan...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveNote,
                child: const Text('Simpan Catatan', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  iconColor: const Color(0xFF00E1FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Mengubah border radius menjadi 5
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Catatan yang disimpan:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _savedNotes.isEmpty
                  ? const Text(
                      'Tidak ada catatan yang disimpan',
                      style: TextStyle(fontSize: 16),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(), // Agar tidak ada scroll di dalam scroll
                      itemCount: _savedNotes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            _savedNotes[index],
                            style: const TextStyle(fontSize: 16),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteNote(index),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
