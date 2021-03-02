import 'package:doom/common/common_style.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';

import 'profile_screen.dart';
import 'video_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 0;
  List pages = [VideoScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        elevation: 0,
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor2,
        selectedIconTheme: IconThemeData(color: Colors.teal),
        selectedLabelStyle: mainTextStyle(16, Colors.black),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: mainTextStyle(15, Colors.red),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.video,
                size: 30,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(
              EvaIcons.person,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[page],
    );
  }
}
