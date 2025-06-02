import 'package:flutter/material.dart';
import 'package:halo_bidan/pages/daftar_screen.dart';
import 'package:halo_bidan/pages/login_screen.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              'Selamat Datang di',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.grey[500],
              ),
            ),
            Text(
              'HaloBidan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 90),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginScreen
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF75BFA3)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text('Masuk'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()), // Navigate to DaftarScreen
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF75BFA3)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(95),
        bottomRight: Radius.circular(95),
      ),
      child: Container(
        color: Color(0xFFBED8BD), // Set the color to #BED8BD
        height: preferredSize.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(), // Menambahkan spacer di atas
            Image.asset(
              'assets/images/logohb.png', // Pastikan Anda memiliki asset gambar ini
              width: 300, // Atur lebar sesuai kebutuhan
              height: 100, // Atur tinggi sesuai kebutuhan
              fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran yang ditentukan
            ),
            SizedBox(height: 10),
            Text(
              'HaloBidan',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Cari solusi masalahmu bersama '),
                  TextSpan(
                    text: 'HaloBidan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 55, // radius + border width
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0), // Menambahkan padding untuk memperkecil gambar
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/img_asset_2_1.png',
                      fit: BoxFit.contain, // Menggunakan BoxFit.contain untuk mempertahankan rasio aspek
                    ),
                  ),
                ),
              ),
            ),
            Spacer(), // Menambahkan spacer di bawah
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(400); // Set the height of the AppBar
}

