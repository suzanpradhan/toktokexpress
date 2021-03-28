import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:toktok/src/screens/navigation_screens/bookmark_screen.dart';
import 'package:toktok/src/screens/navigation_screens/home_screen.dart';
import 'package:toktok/src/screens/navigation_screens/mycart_screen.dart';
import 'package:toktok/src/screens/navigation_screens/setting_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _navigationScreens = <Widget>[
    HomeScreen(),
    MyCartScreen(),
    BookmarkScreen(),
    SettingScreen()
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    this._currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: [
          Icon(Icons.home),
          Icon(Icons.shopping_cart),
          Icon(Icons.bookmark),
          Icon(Icons.settings)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: _navigationScreens[_currentIndex],
        bottom: false,
      ),
    );
  }
}
