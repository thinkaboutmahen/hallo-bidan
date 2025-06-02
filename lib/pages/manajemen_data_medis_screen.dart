import 'package:flutter/material.dart';

class ManajemenDataMedisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manajemen Data Medis'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Riwayat Medis', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Riwayat Kesehatan',
                  ),
                  maxLines: 3,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Obat-obatan yang dikonsumsi',
                  ),
                  maxLines: 2,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Riwayat Alergi',
                  ),
                  maxLines: 2,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Catatan Medis',
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 20),
                Text('Informasi Pendaftaran', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Tanggal Pendaftaran',
                    hintText: 'YYYY-MM-DD',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Sumber Rujukan',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Asuransi Kesehatan',
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

