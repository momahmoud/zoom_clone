import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jitsi_meeting_methods.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';
import 'package:zoom_clone/widgets/text_widget.dart';

class MeetChatScreen extends StatelessWidget {
  MeetChatScreen({Key? key}) : super(key: key);

  final JitsiMeetingMethods _jitsiMeetingMethods = JitsiMeetingMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetingMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            HomeMeetingButton(
              onTap: () {
                createNewMeeting();
              },
              icon: CupertinoIcons.videocam_fill,
              text: 'New Meeting',
            ),
            HomeMeetingButton(
              onTap: () {
                Navigator.pushNamed(context, '/video-call');
              },
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
            ),
            HomeMeetingButton(
              onTap: () {},
              icon: CupertinoIcons.calendar_today,
              text: 'Schedule',
            ),
            HomeMeetingButton(
              onTap: () {},
              icon: Icons.screen_share_rounded,
              text: 'Share Screen',
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: TextWidget(
              text: 'Create/Join Meetings with just a click!',
              fontWeight: FontWeight.w500,
              color: Colors.white70,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
