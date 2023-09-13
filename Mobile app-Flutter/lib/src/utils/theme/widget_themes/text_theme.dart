import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HTextTheme{
  HTextTheme._();    // private constructor
  static TextTheme lightTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.black87,
    ),
    displaySmall:GoogleFonts.montserrat(
      color: Colors.black87,
    ) ,
    headlineLarge: GoogleFonts.montserrat(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 30.0,
    ),

    titleSmall: GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: 24,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.white70,
    ),
    displaySmall:GoogleFonts.montserrat(
      color: Colors.white70,
    ) ,
    headlineLarge: GoogleFonts.montserrat(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 30.0,
    ),
    titleSmall: GoogleFonts.poppins(
        color: Colors.white60,
        fontSize: 24
    ),

  );
}