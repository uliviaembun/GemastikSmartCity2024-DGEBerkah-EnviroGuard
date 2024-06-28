import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'splash_screen.dart';
import 'userprofile_page.dart';
import 'footer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isAirQualitySelected = true;    // Initial display air quality
  // Example data for air quality
  String _airQualityDescription = 'Sangat Baik';  
  int _pm25Value = 40;  
  // Example data for water quality
  String _waterQualityDescription = 'Baik';
  int _ppmValue = 350;

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Logout'),
          content: Text('Apakah Anda yakin ingin keluar?'),
          actions: <Widget>[
            TextButton(
              child: Text('Batal'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop(); // Untuk batal log out
                _logOut(context); // Log out
              },
            ),
          ],
        );
      },
    );
  }
  // Fungsi log out untuk keluar ke splash screen
  void _logOut(BuildContext context) {
    // Logika untuk log out
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ukuran layar
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    // ukuran footer
    double footerHeight = screenHeight * 0.1;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Tinggi default AppBar
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20), // Padding kanan kiri 25 logical pixels
          child: AppBar(
            title: Text(
              'EnviroGuard',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'ChangaOne',
                color: Color(0xFF532F04),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            leadingWidth: 25,
            actions: [
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfilePage()),
                  );
                },
              ),
            ],
            leading: PopupMenuButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              offset: Offset(0, -20), // mengatur posisi menu yang muncul
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 20),
                      Text('Logout'),
                    ],
                  ),
                  onTap: () => _showLogoutDialog(context), // konfirmasi log out
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildSwitchButton(context, 'Kualitas Udara', () {
                    setState(() {
                      _isAirQualitySelected = true;
                    });
                  }),
                  SizedBox(width: 16),
                  _buildSwitchButton(context, 'Kualitas Air', () {
                    setState(() {
                      _isAirQualitySelected = false;
                    });
                  }),
                ],
              ),
              SizedBox(height: screenHeight * 0.07),
              Container(
                width: screenWidth * 0.7,
                height: screenHeight * 0.2,
                decoration: BoxDecoration(
                  color: Color(0xFF532F04),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20), // Padding konten dalam box
                  child: Row(
                    children: <Widget>[
                      // Kolom kiri
                      Expanded(
                        flex: 65,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, // Center terhadap tinggi box
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Kawasan Industri Gresik',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              DateFormat.yMMMMd().format(DateTime.now()) +
                                  '\n' +
                                  DateFormat.Hm().format(DateTime.now()) + ' WIB',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.all(5),
                              width: screenWidth * 0.7 * 0.25,   // 30% dari lebar box
                              height: screenHeight * 0.2 * 0.2,  // 20% dari tinggi box
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  _isAirQualitySelected
                                    ? '$_pm25Value PM\u2082.\u2085'   // value kualitas udara
                                    : '$_ppmValue PPM',               // value kualitas air
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                      // Kolom kanan
                      Expanded(
                        flex: 35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              _getAirQualityIcon(_airQualityDescription),
                              color: Colors.green,
                              size: 80, // Ukuran icon
                            ),
                            SizedBox(height: 5),
                            Text(
                              (_isAirQualitySelected)? 'Kualitas Udara' : 'Kualitas Air',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 1),
                            Text(
                              (_isAirQualitySelected) ? _airQualityDescription : _waterQualityDescription,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,)
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomFooter(footerHeight: footerHeight, activePage: PageIndex.Home),
    );
  }
  // Icon ekspresi
  IconData _getAirQualityIcon(String description) {
    switch (description) {
      case 'Sangat Baik':
        return Icons.sentiment_very_satisfied;
      case 'Baik':
        return Icons.sentiment_satisfied;
      case 'Sedang':
        return Icons.sentiment_neutral;
      case 'Buruk':
        return Icons.sentiment_dissatisfied;
      case 'Sangat Buruk':
        return Icons.sentiment_very_dissatisfied;
      default:
        return Icons.help_outline;
    }
  }
  // Switch button kualitas udara dan air
  Widget _buildSwitchButton(BuildContext context, String label, VoidCallback onPressed) {
    Color buttonColor;
    Color textColor;
    if (_isAirQualitySelected && label == 'Kualitas Udara') {
      buttonColor = Color(0xFF532F04);
      textColor = Colors.white;
    } else if (!_isAirQualitySelected && label == 'Kualitas Air') {
      buttonColor = Color(0xFF532F04);
      textColor = Colors.white;
    } else {
      buttonColor = Colors.grey;
      textColor = Color(0xFF532F04);
    }
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontFamily: 'Inter', 
          fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ); 
  }
}