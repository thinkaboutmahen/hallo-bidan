import 'package:flutter/material.dart';

import 'kalkulator_kehamilan_screen.dart';
import 'laporan_screen.dart';
import 'manajemen_data_medis_screen.dart';
import 'manajemen_data_pasien_screen.dart';

class HomepageBidanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang, Bidan!"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Manajemen Data Pasien'),
            onTap: () {
              // Navigate to Manajemen Data Pasien screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManajemenDataPasienScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Laporan'),
            onTap: () {
              // Navigate to Laporan screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LaporanScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.medical_services),
            title: Text('Manajemen Data Medis'),
            onTap: () {
              // Navigate to Manajemen Data Medis screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManajemenDataMedisScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.pregnant_woman),
            title: Text('Kalkulator Kehamilan'),
            onTap: () {
              // Navigate to Kalkulator Kehamilan screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KalkulatorKehamilanScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

