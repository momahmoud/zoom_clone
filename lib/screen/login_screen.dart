import 'package:doom/common/common_style.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  bool isSeen = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      body: Container(
        height: height,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.teal,
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/video-call.png',
                  height: 100,
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 5,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  EvaIcons.arrowBack,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width,
                height: height / 1.6,
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(.5),
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width / 1.4,
                        child: TextFormField(
                          onSaved: (val) => emailController.text = val,
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "email is empty";
                            }
                            if (!value.trim().contains('@')) {
                              return "invalid email, example@example.com";
                            }
                            if (value.trim().contains(' ')) {
                              return "invalid email, no spaces";
                            }
                            return null;
                          },
                          style: mainTextStyle(18, primaryColor1),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(
                              EvaIcons.emailOutline,
                              color: primaryColor1,
                              size: 26,
                            ),
                            hintStyle: mainTextStyle(
                                20, Colors.black45, FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width / 1.4,
                        child: TextFormField(
                          obscureText: isSeen,
                          onSaved: (val) => passwordController.text = val,
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "password is empty";
                            }
                            if (value.trim().length < 6) {
                              return "password is less than 5 characters";
                            }
                            return null;
                          },
                          style: mainTextStyle(18, primaryColor1),
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isSeen = !isSeen;
                                });
                              },
                              child: Icon(
                                isSeen == true ? EvaIcons.eyeOff : EvaIcons.eye,
                                color: primaryColor1,
                                size: 26,
                              ),
                            ),
                            hintStyle: mainTextStyle(
                                20, Colors.black45, FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Builder(
                        builder: (context) => GestureDetector(
                          onTap: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              try {
                                int count = 0;
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((user) {
                                  if (user.user != null)
                                    Navigator.popUntil(context, (route) {
                                      return count++ == 2;
                                    });
                                });
                              } on FirebaseAuthException catch (e) {
                                SnackBar snackbar = SnackBar(
                                  backgroundColor: Colors.black,
                                  content: Text(
                                    e.message,
                                    style: mainTextStyle(
                                        16, Colors.amber, FontWeight.w300),
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackbar);
                              }
                            }
                          },
                          child: Container(
                            width: width / 1.5,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: GradientColors.teal,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'SIGN IN',
                                style: mainTextStyle(
                                  20,
                                  Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
