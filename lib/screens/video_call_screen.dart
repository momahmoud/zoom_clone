import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jitsi_meeting_methods.dart';
import 'package:zoom_clone/widgets/meeting_option.dart';

import '../utils/colors.dart';
import '../widgets/text_widget.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeetingMethods _jitsiMeetingMethods = JitsiMeetingMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void dispose() {
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        elevation: 0,
        title: const TextWidget(
          text: 'Join a Meeting',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 22,
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room ID',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              _jitsiMeetingMethods.createMeeting(
                roomName: meetingIdController.text,
                isAudioMuted: isAudioMuted,
                isVideoMuted: isVideoMuted,
                username: nameController.text,
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: TextWidget(
                text: 'Join',
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          MeetingOption(
            text: 'Mute Audio',
            isMute: isAudioMuted,
            onChange: (value) {
              setState(() {
                isAudioMuted = value;
              });
            },
          ),
          MeetingOption(
            text: 'Turn Off My Video',
            isMute: isVideoMuted,
            onChange: (value) {
              setState(() {
                isVideoMuted = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
