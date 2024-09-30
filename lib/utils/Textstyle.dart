import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/utils/colors.dart';

class Testyle {
  static TextStyle appbartextstyle() {
    return TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colos.backgroundcolor);
  }

  static TextStyle headingtextstyle() {
    return GoogleFonts.poppins(
        fontSize: 25, color: Colos.textcolor, fontWeight: FontWeight.w600);
  }
}
