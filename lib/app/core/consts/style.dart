import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleConst {
  static Color whiteColor = const Color(0xffffffff);
  static Color blackColor = const Color(0xff000000);
  static Color primaryColor = const Color(0xffC51011);

  static TextTheme myTextTheme = TextTheme(
    displayMedium: GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.5,
        color: whiteColor),
    displaySmall: GoogleFonts.poppins(
        fontSize: 28, fontWeight: FontWeight.w500, color: whiteColor),
    titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: whiteColor),
    titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: whiteColor),
    titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: whiteColor),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 18, fontWeight: FontWeight.w500, color: whiteColor),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: whiteColor),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
        color: whiteColor),
    bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
        color: whiteColor),
    labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: whiteColor),
    labelMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.25,
        color: whiteColor),
    labelSmall: GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
        color: whiteColor),
  );
}
