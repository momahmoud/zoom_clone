import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doom/common/common_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class JoinMeetingScreen extends StatefulWidget {
  @override
  _JoinMeetingScreenState createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  bool isVideoMuted = true;
  bool isAudioMuted = true;
  String username = '';
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    DocumentSnapshot snapshot =
        await userCollection.doc(FirebaseAuth.instance.currentUser.uid).get();
    setState(() {
      username = snapshot.data()['name'];
    });
  }

  joinToMeeting() async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;

      if (Platform.isAndroid) {
        featureFlag.callIntegrationEnabled = false;
      } else if (Platform.isIOS) {
        featureFlag.pipEnabled = false;
      }

      var options = JitsiMeetingOptions()
        ..room = roomController.text
        ..userDisplayName =
            nameController.text == '' ? username : nameController.text
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted
        ..featureFlag = featureFlag;

      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      print('Eror: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * .03,
              ),
              Text(
                'Room Code',
                style: mainTextStyle(20),
              ),
              SizedBox(
                height: height * .04,
              ),
              PinCodeTextField(
                controller: roomController,
                appContext: context,
                length: 6,
                onChanged: (val) {},
                autoDisposeControllers: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                ),
                animationDuration: Duration(milliseconds: 300),
              ),
              SizedBox(
                height: height * .04,
              ),
              TextField(
                controller: nameController,
                style: mainTextStyle(20),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name (Leave if you want your username)",
                    labelStyle: mainTextStyle(16)),
              ),
              SizedBox(
                height: height * .04,
              ),
              CheckboxListTile(
                value: isVideoMuted,
                onChanged: (val) {
                  setState(() {
                    isVideoMuted = val;
                  });
                },
                title: Text(
                  'Video Muted',
                  style: mainTextStyle(
                    17,
                  ),
                ),
              ),
              CheckboxListTile(
                value: isAudioMuted,
                onChanged: (val) {
                  setState(() {
                    isAudioMuted = val;
                  });
                },
                title: Text(
                  'Audio Muted',
                  style: mainTextStyle(
                    17,
                  ),
                ),
              ),
              SizedBox(
                height: height * .04,
              ),
              Text(
                'You can customize your settings in the meeting',
                style: mainTextStyle(16, Colors.grey.shade700, FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 40,
                thickness: 2,
              ),
              SizedBox(
                height: height * .02,
              ),
              InkWell(
                onTap: () => joinToMeeting(),
                child: Container(
                  width: width / 1.6,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: GradientColors.teal,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Join Meeting',
                      style: mainTextStyle(18, Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
