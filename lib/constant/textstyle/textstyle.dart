import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_capstone/constant/colors/colors.dart';

class AppTextStyles {
  static TextStyle titleStyleBrown = GoogleFonts.openSans(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorsCollection.PrimaryColor);
  static TextStyle titleStyle =
      GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle subtitleStyle = GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: ColorsCollection.GreyNeutral);
  static TextStyle textStyleButton = GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: ColorsCollection.WhiteNeutral);
  static TextStyle hintText = GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: ColorsCollection.GreyNeutral);
  static TextStyle hintTextSearch =
      GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w600);
  static TextStyle textProduct =
      GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle titleProduct =
      GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold);
  static TextStyle descriptionProduct =
      GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w400);
  static TextStyle priceProduct =
      GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold);
  static TextStyle goodMorning =
      GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w400);
  static TextStyle userWelcome =
      GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w600);
}
