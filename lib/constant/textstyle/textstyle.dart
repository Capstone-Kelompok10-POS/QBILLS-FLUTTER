import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_capstone/constant/colors/colors.dart';

class AppTextStyles {
  static TextStyle titleStyleBrown = GoogleFonts.openSans(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorsCollection.PrimaryColor);
  static TextStyle titleStyle =
      GoogleFonts.openSans(fontSize: 28, fontWeight: FontWeight.bold);
  static TextStyle titleStyleBlack = GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorsCollection.BlackNeutral);
  static TextStyle titleStyleBlack1 = GoogleFonts.openSans(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorsCollection.BlackNeutral);
  static TextStyle subtitleStyleBlack = GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: ColorsCollection.BlackNeutral);
  static TextStyle subtitleStyle = GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: ColorsCollection.GreyNeutral);
  static TextStyle hintstyletext = GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: ColorsCollection.GreyNeutral);
  static TextStyle textStyleButton = GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: ColorsCollection.WhiteNeutral);
  static TextStyle textStyleButtonBlack = GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: ColorsCollection.BlackNeutral);
  static TextStyle hintText = GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: ColorsCollection.GreyNeutral);
  static TextStyle hintTextSearch =
      GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle textProduct =
      GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle titleProduct =
      GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle descriptionProduct = GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: ColorsCollection.GreyNeutral);
  static TextStyle priceProduct =
      GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold);
  static TextStyle goodMorning =
      GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w400);
  static TextStyle userWelcome =
      GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle labelStyleButton =
      GoogleFonts.openSans(fontSize: 12, color: ColorsCollection.WhiteNeutral);  
}
