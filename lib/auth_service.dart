import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fungsi untuk masuk
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      // Cek peran setelah berhasil masuk
      if (user != null) {
        // Misalnya, cek custom claims atau database untuk peran
        // Contoh sederhana, asumsikan kita punya method untuk mendapatkan peran
        String role = await getUserRole(user.uid);
        if (role == 'bidan') {
          // Logika untuk bidan
        } else if (role == 'pasien') {
          // Logika untuk pasien
        }
      }
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String> getUserRole(String uid) async {
    // Implementasi pengambilan peran dari database atau custom claims
    return 'pasien'; // Contoh default
  }

  // Fungsi untuk mendaftar
  Future<User?> signUp(String email, String password, String role) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if (user != null) {
        // Simpan ke Firestore untuk semua pengguna
        await _firestore.collection('users').doc(user.uid).set({
          'email': email,
          'role': role,
          'uid': user.uid,
          'createdAt': FieldValue.serverTimestamp(), // Menambahkan timestamp dari server
        });
      }
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> setUserRole(String uid, String role) async {
    // Implementasi penyimpanan peran ke database atau custom claims
  }

  Future<void> loginUser(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userCredential.user!.uid).get();
      
      String role = userDoc['role'];
      navigateBasedOnRole(role, context);
    } catch (e) {
      print(e.toString());
    }
  }

  void navigateBasedOnRole(String role, BuildContext context) {
    if (role == 'pasien') {
      Navigator.pushReplacementNamed(context, '/pasienPage');
    } else if (role == 'bidan') {
      Navigator.pushReplacementNamed(context, '/bidanPage');
    }
  }
}


