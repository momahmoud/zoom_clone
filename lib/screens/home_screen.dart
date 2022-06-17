import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/contacts_screen.dart';
import 'package:zoom_clone/screens/meet_chat_screen.dart';
import 'package:zoom_clone/screens/meetings_screen.dart';
import 'package:zoom_clone/screens/settings_screen.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/utils/text_styles.dart';
import 'package:zoom_clone/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    MeetChatScreen(),
    const MeetingsScreen(),
    const ContactsScreen(),
    SettingsScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: backgroundColor,
        centerTitle: true,
        elevation: 0,
        title: const TextWidget(
          text: 'Meet & Chat',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 22,
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.cyan,
        selectedLabelStyle: boldTextStyle,
        unselectedLabelStyle: regularTextStyle,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.videocam_rounded,
            ),
            label: 'Meet & Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_camera_front_rounded),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
