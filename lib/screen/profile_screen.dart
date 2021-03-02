import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doom/common/common_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController usernameController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String username = '';
  bool isUser = false;
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
      isUser = true;
    });
  }

  updateProfile() async {
    if (usernameController.text.isEmpty) {
      return Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          'username is empty',
          style: mainTextStyle(16, Colors.amber, FontWeight.w400),
        ),
        backgroundColor: Colors.black,
      ));
    }
    if (usernameController.text.length < 3) {
      return Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          'username is less than 3 characters',
          style: mainTextStyle(16, Colors.amber, FontWeight.w400),
        ),
        backgroundColor: Colors.black,
      ));
    } else {
      userCollection.doc(FirebaseAuth.instance.currentUser.uid).update({
        "name": usernameController.text,
      });
      setState(() {
        username = usernameController.text;
      });
      Navigator.pop(context);
    }
    Scaffold.of(context).hideCurrentSnackBar();
  }

  editProfile(
    width,
  ) async {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: 200,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: usernameController,
                  style: mainTextStyle(16, Colors.black54),
                  decoration: InputDecoration(
                      labelText: "Update Username",
                      labelStyle: mainTextStyle(15, Colors.black45)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => updateProfile(),
                child: Container(
                  width: width,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: GradientColors.teal,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Update',
                      style: mainTextStyle(18, Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: width,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: GradientColors.teal,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: mainTextStyle(18, Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      body: isUser == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    width: double.infinity,
                    height: height / 2.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: GradientColors.teal,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: width / 2 - 64,
                    top: height / 3.2,
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/doom-b36fc.appspot.com/o/download.png?alt=media&token=cd3d7d19-c2ca-42e4-80e7-d500e7c09d18'),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * .4,
                      ),
                      Text(
                        username,
                        style: mainTextStyle(
                          20,
                        ),
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      InkWell(
                        onTap: () => editProfile(width / 1.8),
                        child: Container(
                          width: width / 2,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: GradientColors.teal,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Edit Profile',
                              style: mainTextStyle(18, Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
