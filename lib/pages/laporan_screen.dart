import 'package:flutter/material.dart';

class LaporanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Pelayanan Bidan'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Identitas Bidan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nama Bidan',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Tanggal Pelaporan',
                    hintText: 'YYYY-MM-DD',
                  ),
                ),
                SizedBox(height: 20),
                Text('Pelayanan Bidan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nama Pasien',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Jenis Pelayanan',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Usia Pasien',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Keluhan dan Gejala Pasien',
                  ),
                  maxLines: 3,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Hasil Pemeriksaan',
                  ),
                  maxLines: 3,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Diagnosa',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Rencana Pengobatan',
                  ),
                  maxLines: 3,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Rujukan',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Edukasi atau Konseling',
                  ),
                  maxLines: 3,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Tindak Lanjut',
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

