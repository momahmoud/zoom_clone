import 'package:doom/common/common_style.dart';
import 'package:doom/screen/create_meeting_screen.dart';
import 'package:doom/screen/join_meeting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(
          'DOOM',
          style: mainTextStyle(
            22,
            Colors.white,
            FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: tabController,
          tabs: [
            buildTab('Join Meeting'),
            buildTab('Create Meeting'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          JoinMeetingScreen(),
          CreateMeetingScreen(),
        ],
      ),
    );
  }

  buildTab(String name) {
    return Card(
      shadowColor: Colors.teal,
      color: Colors.teal[600],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 20,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: GradientColors.teal,
          ),
        ),
        width: MediaQuery.of(context).size.width / 2,
        height: 40,
        child: Center(
          child: Text(
            name,
            style: mainTextStyle(18, Colors.white, FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
