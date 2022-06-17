import 'package:flutter/material.dart';
import 'package:zoom_clone/widgets/text_widget.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: TextWidget(
      text: text,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 16,
    ),
  ));
}
