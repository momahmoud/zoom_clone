import 'package:doom/common/common_style.dart';
import 'package:doom/screen/auth_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isSigned = false;

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      dotsDecorator: DotsDecorator(
        activeColor: primaryColor2,
      ),
      nextFlex: 0,
      skipFlex: 0,
      next: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Next',
            style: mainTextStyle(16),
          ),
          Icon(EvaIcons.arrowIosForwardOutline)
        ],
      ),
      done: Text(
        'Done',
        style: mainTextStyle(18, primaryColor1),
      ),
      onDone: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AuthScreen()));
      },
      onSkip: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AuthScreen()));
      },
      skip: Text(
        'Skip',
        style: mainTextStyle(16),
      ),
      showSkipButton: true,
      pages: [
        PageViewModel(
          title: "Welcome",
          body: "Welcome to Doom, the best video conference app",
          image: Center(
            child: Image.asset(
              'assets/images/wl.png',
              height: 300,
              width: 400,
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle: mainTextStyle(23, primaryColor1),
            bodyTextStyle: mainTextStyle(22),
          ),
        ),
        PageViewModel(
          title: "Join or start meetings",
          body: "Easy to use interface, join or start meetings in a fast time",
          image: Center(
            child: Image.asset(
              'assets/images/conference.png',
              height: 300,
              width: 400,
            ),
          ),
          decoration: PageDecoration(
            bodyTextStyle: mainTextStyle(22, Colors.black87),
            titleTextStyle: mainTextStyle(23, primaryColor1),
          ),
        ),
        PageViewModel(
          title: "Security",
          body:
              "Your security is important for us, Our servers are secure and reliable",
          image: Center(
            child: Image.asset(
              'assets/images/sec.png',
              height: 300,
              width: 400,
            ),
          ),
          decoration: PageDecoration(
            bodyTextStyle: mainTextStyle(22, Color(0xff403d55)),
            titleTextStyle: mainTextStyle(23, primaryColor1),
          ),
        ),
      ],
    );
  }
}
