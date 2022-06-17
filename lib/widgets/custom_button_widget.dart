import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String text;
  const CustomButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.cyan,
          minimumSize: const Size(double.infinity, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: TextWidget(
          text: text,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 22,
        ),
      ),
    );
  }
}
