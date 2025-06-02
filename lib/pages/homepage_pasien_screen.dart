import 'package:flutter/material.dart';
import 'package:flutter/services.dart';  // Import untuk SystemNavigator

import 'jadwal_janji_temu_screen.dart'; // Pastikan Anda mengimpor halaman JadwalJanjiTemuScreen
import 'kalkulator_kehamilan_screen.dart'; // Import KalkulatorScreen
import 'notification_screen.dart';
import 'profile_screen.dart'; // Import ProfileScreen
import 'riwayat_pemeriksaan_screen.dart';


class HomepagePasienScreen extends StatefulWidget {
  @override
  _HomepagePasienScreenState createState() => _HomepagePasienScreenState();
}

class _HomepagePasienScreenState extends State<HomepagePasienScreen> {
  int _selectedIndex = 1;  // Index untuk 'Beranda' yang akan di-highlight

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Logika navigasi berdasarkan index
    switch (index) {
      case 0:
        Navigator.pushReplacement(  // Use pushReplacement to change the screen without stacking
          context,
          MaterialPageRoute(builder: (context) => JadwalJanjiTemuScreen()),
        );
        break;
      case 1:
        // Already on Home, no need to navigate
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    // Menunggu data kembali dari halaman lain
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration.zero, () {
        setState(() {
          _selectedIndex = 1;  // Pastikan Beranda selalu terpilih ketika kembali
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();  // Keluar dari aplikasi
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Selamat Datang"),
          automaticallyImplyLeading: false,  // This prevents the back button from appearing
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(23.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Temukan", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Layanan Kesehatan", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Search/Mencari',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                    SizedBox(height: 40),
                    Text("Pilih Pelayanan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ListTile(
                      title: Text("Riwayat Pemeriksaan"),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFBED8BD),
                          image: DecorationImage(
                            image: AssetImage("assets/images/riwayat pemeriksaan.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RiwayatPemeriksaanScreen()),
                        );
                      },
                    ),
                    ListTile(
                      title: Text("Kalkulator Kehamilan"),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFBED8BD),
                          image: DecorationImage(
                            image: AssetImage("assets/images/kalkulator kehamilan.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KalkulatorKehamilanScreen()),
                        );
                      },
                    ),
                    SizedBox(height: 55),
                    Text("Artikel Kesehatan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          articleContainer("Artikel 1"),
                          articleContainer("Artikel 2"),
                          articleContainer("Artikel 3"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
      ),
    );
  }

  Widget articleContainer(String title) {
    return Container(
      width: 160,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        border: Border.all(color: Colors.black, width: 2),  // Border ditambahkan di sini
        borderRadius: BorderRadius.circular(5),  // Opsi untuk membuat sudut border membulat
      ),
      child: Center(
        child: Text(title),
      ),
    );
  }
}

