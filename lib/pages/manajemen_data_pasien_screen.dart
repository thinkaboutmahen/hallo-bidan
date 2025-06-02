import 'package:flutter/material.dart';

class ManajemenDataPasienScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manajemen Data Pasien'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Data Pasien', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nama Pasien',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Tanggal Lahir',
                    hintText: 'YYYY-MM-DD',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nomor HP',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nomor Kontak Darurat',
                  ),
                ),
                SizedBox(height: 20),
                Text('Kontak Informasi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Kota',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Provinsi',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Kecamatan',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                  },
                  child: Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

