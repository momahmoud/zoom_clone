import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/text_widget.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;
  const MeetingOption({
    Key? key,
    required this.text,
    required this.isMute,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 10),
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextWidget(
            text: text,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 248, 242, 242),
            fontSize: 16,
          ),
          Switch.adaptive(
            value: isMute,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}
