import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../styles/colors/colors.dart';

Widget buildCustomText({
  required String text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  TextOverflow? overflow,
  int? maxLines,
  Alignment? alignment,
}) {
  return Align(
    alignment: alignment ?? Alignment.centerLeft,
    child: Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.merriweatherSans(
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.bold,
        color: color ?? black,
      ),
    ),
  );
}
