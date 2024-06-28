import 'package:flutter/material.dart';
import 'footer.dart'; 

class BenefitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ukuran layar
    final double screenHeight = MediaQuery.of(context).size.height;
    // tinggi footer
    double footerHeight = screenHeight * 0.1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Benefit'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Ini Benefit Page'),
      ),
      bottomNavigationBar: CustomFooter(
        footerHeight: footerHeight,
        activePage: PageIndex.Benefit 
      ),
    );
  }
}