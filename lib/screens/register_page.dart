import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(''), backgroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Center(
                child: Text(
                  'DAFTAR',
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'ChangaOne', // Pastikan font ChangaOne telah diimport
                    color: Color(0xFF532F04),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Text('Buat akun baru'),
            SizedBox(height: 16),
            // Form untuk registrasi
            Padding(
              padding: EdgeInsets.all(30), // Margin minimal 30 piksel
              child: RegisterForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _registerAccount() {
    // Validasi dan logika untuk registrasi akun
    // Simpan logika validasi di sini
    // Jika berhasil, tampilkan popup atau notifikasi bahwa akun berhasil dibuat
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registrasi Berhasil'),
          content: Text(
              'Akun Anda berhasil dibuat. Silakan masuk untuk melanjutkan.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

 @override
  Widget build(BuildContext context) {
    // Ukuran layar
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    // Jarak antar komponen
    double emailToPasswordSpace = screenHeight * 0.02;
    double passwordToConfirmPasswordSpace = screenHeight * 0.02;
    double confirmPasswordToButtonSpace = screenHeight * 0.07;
    // Ukuran button daftar
    double buttonWidth = screenWidth * 0.4;
    double buttonHeight = screenHeight * 0.04;
    // Ukuran font di button daftar
    double fontSize = buttonHeight * 0.3; 

    return Padding(
      padding: EdgeInsets.all(16), // Padding kolom
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(fontSize:16, color:Colors.black),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              filled: true,
              fillColor: Colors.brown.withOpacity(0.1), // Warna background coklat transparan
            ),
          ),
          SizedBox(height: emailToPasswordSpace), // Jarak antara kolom email dan kata sandi
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Kata Sandi',
              labelStyle: TextStyle(fontSize:16, color:Colors.black),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              filled: true,
              fillColor: Colors.brown.withOpacity(0.1), // Warna background coklat transparan
            ),
            obscureText: true,
          ),
          SizedBox(height: passwordToConfirmPasswordSpace), // Jarak antara kolom kata sandi dan konfirmasi kata sandi
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              labelText: 'Konfirmasi Kata Sandi',
              labelStyle: TextStyle(fontSize:16, color:Colors.black),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              filled: true,
              fillColor: Colors.brown.withOpacity(0.1), // Warna background coklat transparan
            ),
            obscureText: true,
          ),
           SizedBox(height: confirmPasswordToButtonSpace), // Jarak antara kolom konfirmasi kata sandi dan button daftar
          Container(
            width: buttonWidth,
            height: buttonHeight, 
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF532F04), // Warna background 
                foregroundColor: Colors.white, // Warna teks
                minimumSize: Size(buttonWidth, buttonHeight), 
              ),
              onPressed: _registerAccount,
              child: Text(
                'DAFTAR AKUN',
                style: TextStyle(
                  fontSize: fontSize, 
                  fontFamily: 'Roboto', 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}