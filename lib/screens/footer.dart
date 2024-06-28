import 'package:flutter/material.dart';
import 'education_page.dart';
import 'benefit_page.dart';
import 'health_page.dart';
import 'home_page.dart';

enum PageIndex {
  Home,
  Education,
  Benefit,
  Health,
}

class CustomFooter extends StatelessWidget {
  final double footerHeight;
  final PageIndex activePage; 

  CustomFooter({required this.footerHeight, required this.activePage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: footerHeight,
      color: Color(0xFF532F04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildNavigationButton(context, Icons.home, 'Home', PageIndex.Home, () {
            if (activePage != PageIndex.Home) {
              Navigator.pop(context); // balik ke halaman Home jika bukan berada di halaman Home
            }
          }),
          _buildNavigationButton(context, Icons.school, 'Education', PageIndex.Education, () {
            if (activePage != PageIndex.Education) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EducationPage()),
              );
            }
          }),
          _buildNavigationButton(context, Icons.attach_money, 'Benefit', PageIndex.Benefit, () {
            if (activePage != PageIndex.Benefit) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BenefitPage()),
              );
            }
          }),
          _buildNavigationButton(context, Icons.favorite, 'Health', PageIndex.Health, () {
            if (activePage != PageIndex.Health) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HealthPage()),
              );
            }
          }),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(
      BuildContext context, IconData icon, String label, PageIndex pageIndex, VoidCallback onPressed) {
    bool isActive = activePage == pageIndex;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            icon,
            color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
            size: isActive ? 30 : 25, // ukuran ikon lebih besar jika aktif
          ),
          onPressed: () {
            if (activePage != pageIndex) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => pageIndex == PageIndex.Home
                      ? HomePage()
                      : pageIndex == PageIndex.Education
                      ? EducationPage()
                      : pageIndex == PageIndex.Benefit
                      ? BenefitPage()
                      : HealthPage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    // menghindari animasi switch page dengan mengembalikan child saja
                    return child;
                  },
                ),
              );
            }
          },
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}