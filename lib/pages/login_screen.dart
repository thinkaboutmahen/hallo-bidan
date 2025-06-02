import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halo_bidan/pages/daftar_screen.dart';

import 'lupa_password_screen.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordHidden = true; // Define the variable here

  Future<void> signInWithEmailAndPassword() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print("User logged in: ${credential.user}");
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Login'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30), // Menyisakan putih di kiri dan kanan
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Memposisikan ke tengah
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30), // Menyisakan putih di kiri dan kanan
                decoration: BoxDecoration(
                  color: Color(0xFFBED8BD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Kata Sandi',
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                icon: Icon(_isPasswordHidden ? Icons.visibility_off : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordHidden = !_isPasswordHidden;
                                  });
                                },
                              ),
                            ),
                            obscureText: _isPasswordHidden,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => signInWithEmailAndPassword(),
                      child: Text('Masuk'),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              SizedBox(height: 50), // Menambah jarak antara box dan tombol "Lupa Password"
              TextButton(
                onPressed: () {
                  // Add action for "Lupa Password" button
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPasswordScreen()), // Navigate to ForgotPasswordScreen
                  );
                },
                child: Text('Lupa Kata Sandi?'),
              ),
              SizedBox(height: 10), // Menambah jarak antara tombol "Lupa Password" dan "Belum punya akun?"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Belum punya akun?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text('Daftar', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

