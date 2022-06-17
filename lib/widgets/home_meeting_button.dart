import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/text_widget.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;
  const HomeMeetingButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(.06),
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            width: 50,
            height: 50,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          TextWidget(
            text: text,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontSize: 15,
          )
        ],
      ),
    );
  }
}
