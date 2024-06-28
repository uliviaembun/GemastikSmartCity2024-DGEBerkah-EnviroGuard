import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ukuran layar
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    // kuran button masuk dan daftar 
    final double buttonWidth = screenWidth * 0.3; // 30% panjang layar
    final double buttonHeight = screenHeight * 0.04; // 6% tinggi layar
    // ukuran font di button
    final double fontSize = buttonHeight * 0.3; // 30% tinggi tombol

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 150),
              FittedBox(
                child: Image.asset(
                  'images/logo-enviroguard.png',
                ),
              ),
              Text(
                'EnviroGuard',
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: 'ChangaOne',
                  color: Color(0xFF532F04),
                ),
              ),
              SizedBox(height: 100),
              Text(
                'Selamat Datang!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Jika Anda belum memiliki akun sebelumnya, silahkan pilih menu Daftar untuk membuat akun terlebih dahulu.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 100),

              // button masuk dan daftar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF532F04),
                      shadowColor: Color(0xFF532F04),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Color(0xFF532F04)),
                      ),
                      padding: EdgeInsets.all(buttonHeight / 2),
                      minimumSize: Size(buttonWidth, buttonHeight),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('MASUK',
                      style: TextStyle(
                        fontSize: fontSize, // Menggunakan ukuran font yang dihitung
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF532F04),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(buttonHeight / 2),
                      minimumSize: Size(buttonWidth, buttonHeight),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text('DAFTAR',
                      style: TextStyle(
                        fontSize: fontSize, // Menggunakan ukuran font yang dihitung
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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