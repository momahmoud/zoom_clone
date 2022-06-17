import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/utils/text_styles.dart';
import 'package:zoom_clone/widgets/custom_button_widget.dart';
import 'package:zoom_clone/widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const TextWidget(
            text: 'Start or join a meeting',
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 40,
          ),
          Image.asset(
            'assets/images/onboarding.jpg',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonWidget(
            onPressed: () async {
              bool res = await _authMethods.signInWithGoogle(context);
              if (res) {
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, '/home');
              }
            },
            text: 'Google Sign In',
          )
        ],
      ),
    );
  }
}
