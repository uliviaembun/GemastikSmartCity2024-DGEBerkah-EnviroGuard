import 'package:flutter/material.dart';
import 'footer.dart'; 

class HealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ukuran layar
    final double screenHeight = MediaQuery.of(context).size.height;

    // inggi footer
    double footerHeight = screenHeight * 0.1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Health'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Ini Health Page'),
      ),
      bottomNavigationBar: CustomFooter(
        footerHeight: footerHeight,
        activePage: PageIndex.Health, 
      ),
    );
  }
}