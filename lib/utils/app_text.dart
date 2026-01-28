import 'package:evently_app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static TextStyle regularText({
    required Color color,
    required double fontSize,
  }) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: sp(fontSize),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle mediumText({
    required Color color,
    required double fontSize,
  }) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: sp(fontSize),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiBoldText({
    required Color color,
    required double fontSize,
  }) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: sp(fontSize),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle boldText({required Color color, required double fontSize}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: sp(fontSize),
      fontWeight: FontWeight.bold,
    );
  }
}
