import 'package:flutter/material.dart';

class RiwayatPemeriksaanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pemeriksaan Pasien'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Informasi Pasien', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Nama: John Doe'),
            Text('Tanggal Lahir: 01 Januari 1990'),
            Text('Alamat: Jalan Kesehatan No. 10, Jakarta'),
            Text('Nomor Telepon: 081234567890'),
            Text('Nomor Rekam Medis: 1234567890'),
            SizedBox(height: 20),

            Text('Riwayat Medis', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Penyakit Kronis: Diabetes Mellitus'),
            Text('Riwayat Operasi: Appendectomy pada tahun 2015'),
            Text('Alergi: Penicillin'),
            Text('Riwayat Keluarga: Hipertensi pada ayah'),
            SizedBox(height: 20),

            Text('Pemeriksaan Fisik', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Tekanan Darah: 120/80 mmHg'),
            Text('Denyut Nadi: 72 bpm'),
            Text('Suhu Tubuh: 36.5°C'),
            Text('Berat Badan: 70 kg'),
            SizedBox(height: 20),

            Text('Hasil Tes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Tes Darah: Normal'),
            Text('Tes Urin: Normal'),
            Text('Pencitraan: MRI menunjukkan normal'),
            SizedBox(height: 20),

            Text('Diagnosis', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Diagnosis: Diabetes Mellitus Tipe 2'),
            SizedBox(height: 20),

            Text('Rencana Perawatan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Obat: Metformin 500 mg'),
            Text('Terapi: Konsultasi nutrisi bulanan'),
            Text('Prosedur: Pemeriksaan rutin setiap 3 bulan'),
            SizedBox(height: 20),

            Text('Catatan Tambahan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Instruksi: Minum obat secara teratur dan pantau kadar gula darah'),
          ],
        ),
      ),
    );
  }
}

