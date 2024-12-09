import 'package:flutter/material.dart';
import 'package:yourdiary3/pages/menu_page/explore_page.dart';
import 'package:yourdiary3/pages/menu_page/home_page.dart';
import 'package:yourdiary3/pages/menu_page/journal_page.dart';
import 'package:yourdiary3/theme.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  int _currentIndex = 0;
  List<Widget> body = [
    HomePage(),
    ExplorePage(),
    JournalPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          // color: green2Color, // Warna latar belakang
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: blue2Color,
            selectedItemColor: blueColor,
            unselectedItemColor: blueColor,
            selectedLabelStyle: boldTextStyle,
            unselectedLabelStyle: lightTextStyle,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            onTap: (int newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: "Home",
                activeIcon: Image.asset("assets/home.png"),
                icon: Image.asset("assets/unhome.png"),
              ),
              BottomNavigationBarItem(
                label: "Explore",
                activeIcon: Image.asset("assets/rocket.png"),
                icon: Image.asset('assets/unrocket.png'),
              ),
              // BottomNavigationBarItem(
              //   label: "Community",
              //   activeIcon: Image.asset("assets/users.png"),
              //   icon: Image.asset('assets/unusers.png'),
              // ),
              BottomNavigationBarItem(
                label: "Journal",
                activeIcon: Image.asset("assets/document.png"),
                icon: Image.asset('assets/undocument.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
