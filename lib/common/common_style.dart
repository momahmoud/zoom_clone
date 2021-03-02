import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle mainTextStyle(double fontSize,
    [Color color, FontWeight fontWeight = FontWeight.w700]) {
  return GoogleFonts.montserrat(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

Color primaryColor1 = Color(0xfffd4655);
Color primaryColor2 = Color(0xff55c7a6);

CollectionReference userCollection =
    FirebaseFirestore.instance.collection('users');
