import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:halo_bidan/firebase_options.dart';
import 'package:halo_bidan/pages/homepage_bidan_screen.dart';
import 'package:halo_bidan/pages/homepage_pasien_screen.dart';

import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/pasienPage': (context) => HomepagePasienScreen(),
        '/bidanPage': (context) => HomepageBidanScreen(),
      },
    );
  }
}

