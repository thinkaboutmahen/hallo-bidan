import 'package:flutter/material.dart';

import 'homepage_pasien_screen.dart';
import 'jadwal_janji_temu_screen.dart';
import 'notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

int _selectedIndex = 2;  // Index untuk 'Beranda' yang akan di-highlight

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Logika navigasi berdasarkan index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JadwalJanjiTemuScreen()), // Navigasi ke Jadwal Janji Temu Screen
        );
        break;
      case 1:
        // Sudah di Beranda, tidak perlu navigasi
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomepagePasienScreen()), // Navigasi ke Homepage Pasien Screen
        );
        break;
      case 2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pasien'),
        automaticallyImplyLeading: false,  // Menghilangkan tombol kembali
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),  // Ikon lonceng
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()), // Navigasi ke Notification Screen
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Nama Pasien',
            ),
          ),
          TextFormField(
            controller: _dobController,
            decoration: InputDecoration(
              labelText: 'Tanggal Lahir',
            ),
            keyboardType: TextInputType.datetime,
          ),
          TextFormField(
            controller: _addressController,
            decoration: InputDecoration(
              labelText: 'Alamat',
            ),
          ),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Nomor HP',
            ),
            keyboardType: TextInputType.phone,
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            controller: _roleController,
            decoration: InputDecoration(
              labelText: 'Login Sebagai',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Simpan logika untuk menyimpan data
              print('Data disimpan');
            },
            child: Text('Simpan'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFBED8BD),  // Menambahkan warna latar belakang
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

