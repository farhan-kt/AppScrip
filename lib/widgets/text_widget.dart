import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget poppinsText(
    {text, color, fontWeight, double? fontSize, textAlign, overflow, maxLine}) {
  return Text(text,
      overflow: overflow,
      maxLines: maxLine,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          color: color, fontWeight: fontWeight, fontSize: fontSize));
}
