import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/utils/text_styles.dart';
import 'package:zoom_clone/widgets/custom_button_widget.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
        onPressed: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return Dialog(
                  child: SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Sign Out',
                          style: boldTextStyle,
                        ),
                        Text(
                          'Are you sure?',
                          style: regularTextStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: CustomButtonWidget(
                                onPressed: () {
                                  _authMethods.signOut(context);
                                },
                                text: 'Ok',
                              ),
                            ),
                            Expanded(
                              child: CustomButtonWidget(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                text: 'No',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        text: 'Sign out');
  }
}
