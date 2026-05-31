import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  static TextStyle get h1 => GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
      );

  static TextStyle get h2 => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      );

  static TextStyle get h3 => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.43,
      );

  static TextStyle get buttonText => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      );

  static TextStyle get caption => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.25,
      );
}
