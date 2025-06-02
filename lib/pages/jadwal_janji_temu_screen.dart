import 'package:flutter/material.dart';

import 'homepage_pasien_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class JadwalJanjiTemuScreen extends StatefulWidget {
  @override
  _JadwalJanjiTemuScreenState createState() => _JadwalJanjiTemuScreenState();
}

class _JadwalJanjiTemuScreenState extends State<JadwalJanjiTemuScreen> {
  int _selectedIndex = 0;  // Index untuk 'Beranda' yang akan di-highlight

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Logika navigasi berdasarkan index
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomepagePasienScreen()), // Navigasi ke Homepage Pasien Screen
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()), // Navigasi ke Profile Screen
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jadwal Temu"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()), // Navigasi ke Notification Screen
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Nama Pasien: Nama lengkap ibu hamil atau pasien yang akan melahirkan.", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Nomor Rekam Medis: Nomor identifikasi unik pasien di sistem klinik bersalin tersebut.", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Informasi Kontak: Nomor telepon atau alamat email pasien.", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Tanggal Perkiraan Persalinan (HPL): Tanggal perkiraan persalinan.", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Nama Dokter Kandungan atau Bidan: Nama dokter atau bidan yang akan merawat.", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Riwayat Kesehatan Kehamilan: Informasi tentang riwayat kesehatan kehamilan.", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Instruksi Persiapan Persalinan: Instruksi khusus untuk persiapan persalinan.", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Informasi Penting untuk Persalinan: Informasi tambahan yang relevan.", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Instruksi Pemantauan Kondisi: Instruksi tentang bagaimana memantau kondisi.", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Pengaturan Ulang atau Pembatalan Janji: Instruksi tentang bagaimana mengatur ulang atau membatalkan janji.", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFBED8BD),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Jadwal Temu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
    );
  }
}

