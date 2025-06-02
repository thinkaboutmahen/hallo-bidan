import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'splash_screen.dart'; // Ganti dengan path yang benar ke file SplashScreen Anda

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _kataSandiController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomorHPController = TextEditingController();
  bool _isPasswordHidden = true;  // Define the variable here

  Future<void> registerWithEmailAndPassword() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _kataSandiController.text,
      );
      print("User registered: ${credential.user}");
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Akun '),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30), // Menyisakan putih di kiri dan kanan
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Memposisikan ke tengah
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25), // Menyisakan putih di kiri dan kanan
                decoration: BoxDecoration(
                  color: Color(0xFFBED8BD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'Daftar Akun',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        hintText: 'Nama Lengkap',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _nomorHPController,
                      keyboardType: TextInputType.number, // Memastikan hanya input numerik
                      decoration: InputDecoration(
                        hintText: 'Nomor HP',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _kataSandiController,
                      obscureText: _isPasswordHidden,
                      decoration: InputDecoration(
                        hintText: 'Kata Sandi',
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                            color: Colors.black, // Menambahkan warna hitam
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordHidden = !_isPasswordHidden;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        String namaLengkap = _namaController.text;
                        String email = _emailController.text;
                        String nomorHP = _nomorHPController.text;
                        String kataSandi = _kataSandiController.text;

                        // Cek apakah semua field telah diisi dan nomor HP adalah 11 atau 12 angka
                        if (namaLengkap.isEmpty || email.isEmpty || nomorHP.isEmpty || kataSandi.isEmpty || !RegExp(r'^\d{11,12}$').hasMatch(nomorHP)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Harap isi semua form yang diperlukan!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          // Simpan data ke Firestore
                          try {
                            FirebaseFirestore.instance.collection('users').add({
                              'namaLengkap': namaLengkap,
                              'email': email,
                              'nomorHP': nomorHP,
                              'kataSandi': kataSandi,
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Akun berhasil didaftarkan!'),
                              ),
                            );

                            // Tambahkan jeda sebelum mengalihkan ke SplashScreen
                            await Future.delayed(Duration(seconds: 5));  // Jeda selama 2 detik

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SplashScreen()),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Gagal mendaftarkan akun: $e'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      child: Text('Daftar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF75BFA3),
                        foregroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

