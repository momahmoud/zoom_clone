import 'package:doom/common/common_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:uuid/uuid.dart';

class CreateMeetingScreen extends StatefulWidget {
  @override
  _CreateMeetingScreenState createState() => _CreateMeetingScreenState();
}

class _CreateMeetingScreenState extends State<CreateMeetingScreen> {
  String code = '';

  createCode() {
    setState(() {
      code = Uuid().v1().substring(0, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: width / 1.5,
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Create a code and share it with your friends',
                style: mainTextStyle(20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: height * .06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Code: ',
                style: mainTextStyle(30),
              ),
              Text(
                code,
                style: mainTextStyle(30, primaryColor1, FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: height * .07,
          ),
          InkWell(
            onTap: () => createCode(),
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
                  'Create Code',
                  style: mainTextStyle(18, Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
