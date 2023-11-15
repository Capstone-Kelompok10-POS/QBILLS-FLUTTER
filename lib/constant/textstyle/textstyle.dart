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
}
