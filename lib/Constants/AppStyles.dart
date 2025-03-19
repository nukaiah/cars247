import 'package:carwash/Constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TxtStyles{
  static TextStyle inputStyle = GoogleFonts.nunitoSans(
      textStyle: TextStyle(
        fontSize: 14,
        letterSpacing: 0.25,
        color: blackClr,
        fontWeight: FontWeight.w700,
      )
  );
  static TextStyle inputWhiteStyle = GoogleFonts.nunitoSans(
      textStyle: TextStyle(
        fontSize: 14,
        letterSpacing: 0.25,
        color: bgColor,
        fontWeight: FontWeight.w700,
      )
  );
  static TextStyle labelStyle = GoogleFonts.nunitoSans(
      textStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.25,
        color: blackClr,
        fontWeight: FontWeight.w700,
      )
  );
  static TextStyle hintStyle = GoogleFonts.nunitoSans(
      textStyle:  TextStyle(
        fontSize: 16,
        letterSpacing: 0.25,
        color: greyClr,
        fontWeight: FontWeight.w700,
      )
  );
  static TextStyle smallHintStyle = GoogleFonts.nunitoSans(
      textStyle:  TextStyle(
        fontSize: 12,
        letterSpacing: 0.25,
        color: greyClr,
        fontWeight: FontWeight.w700,
      )
  );
  static TextStyle errorStyle = GoogleFonts.nunitoSans(
      textStyle:  TextStyle(
        fontSize: 16,
        letterSpacing: 0.25,
        color: g4,
        fontWeight: FontWeight.w700,
      )
  );
  static TextStyle clickStyle = GoogleFonts.nunitoSans(
      textStyle:  TextStyle(
        fontSize: 15,
        letterSpacing: 0.25,
        color: indClr,
        fontWeight: FontWeight.w700,
      )
  );
  static TextStyle whiteStyle = GoogleFonts.nunitoSans(
      textStyle:  TextStyle(
        fontSize: 18,
        letterSpacing: 0.25,
        color: bgColor,
        fontWeight: FontWeight.w700,
      )
  );

  static TextStyle headerStyle = GoogleFonts.nunitoSans(
      textStyle: TextStyle(
        fontSize: 19,
        letterSpacing: 0.2,
        color: blackClr,
        fontWeight: FontWeight.w800,
      )
  );

  static TextStyle customStyle({color}) => GoogleFonts.nunitoSans(
      textStyle:  TextStyle(
        fontSize: 15,
        letterSpacing: 0.25,
        color: color,
        fontWeight: FontWeight.w700,
      )
  );
}