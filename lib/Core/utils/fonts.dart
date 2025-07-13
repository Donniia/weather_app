import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  final title1 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 64,
      color: Colors.white,
    ),
  );
  final title2 = GoogleFonts.poppins(
      textStyle: TextStyle(fontSize: 64, color: Color(0xffDDB130)));
  final buttonTextStyle = GoogleFonts.lato(textStyle: TextStyle(color: Color(0xff362a84),fontSize: 25,fontWeight: FontWeight.w400));
  final authTitle = GoogleFonts.poppins(fontSize: 35,color: Colors.white,fontWeight: FontWeight.w600);
}
