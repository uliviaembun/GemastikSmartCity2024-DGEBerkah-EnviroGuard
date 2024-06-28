import 'package:flutter/material.dart';
import 'home_page.dart'; 

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(''), backgroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Menambahkan teks "MASUK" di tengah
            Padding(
              padding: EdgeInsets.only(top: 0), // Jarak dari atas
              child: Center(
                child: Text(
                  'MASUK',
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'ChangaOne',
                    color: Color(0xFF532F04),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Text('Masuk dengan akun yang sudah terdaftar'),
            SizedBox(height: 16),
            // Form untuk login
            Padding(
              padding: EdgeInsets.all(30), // Margin minimal 30 piksel
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Validasi dan logika untuk login
    // Misalnya, validasi email dan password
    // Simpan logika validasi di sini
    // Contoh sederhana, langsung navigasi ke halaman Home jika login berhasil
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()), // Ganti dengan halaman yang sesuai
    );
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Menghitung jarak berdasarkan tinggi layar
    double emailToPasswordSpace = screenHeight * 0.02;
    double passwordToButtonSpace = screenHeight * 0.07;

    // Menghitung ukuran tombol berdasarkan ukuran layar
    double buttonWidth = screenWidth * 0.4;
    double buttonHeight = screenHeight * 0.04;

    // Menghitung ukuran font berdasarkan tinggi tombol
    double fontSize = buttonHeight * 0.3; // 30% dari tinggi tombol

    return Padding(
      padding: EdgeInsets.all(16), // Padding internal untuk isi formulir
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
              fillColor: Colors.brown.withOpacity(0.1), // Warna latar belakang coklat muda
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
              fillColor: Colors.brown.withOpacity(0.1), // Warna latar belakang coklat muda
            ),
            obscureText: true,
          ),
          SizedBox(height: passwordToButtonSpace), // Jarak antara kolom kata sandi dan tombol
              Container(
            width: buttonWidth, 
            height: buttonHeight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF532F04), // Warna background coklat
                foregroundColor: Colors.white, // Warna teks putih
                minimumSize: Size(buttonWidth, buttonHeight), 
              ),
              onPressed: _login,
              child: Text(
                'MASUK',
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