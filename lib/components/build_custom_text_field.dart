import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../styles/colors/colors.dart';

Widget buildCustomTextField({
  String? hintText,
  String? labelText,
  required TextEditingController controller,
  required TextInputType type,
  FormFieldValidator? validator,
  Function(String? value)? onSaved,
  IconData? icon,
}) {
  return TextFormField(
    cursorColor: black,
    controller: controller,
    keyboardType: type,
    style: GoogleFonts.merriweatherSans(),
    decoration: InputDecoration(
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(color: yellow),
      prefixIcon: Icon(icon, size: 22, color: yellow.withOpacity(0.65)),
      border: const UnderlineInputBorder(),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: grey.withOpacity(0.6), width: 0.6),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: yellow.withOpacity(0.6), width: 0.6),
      ),
    ),
    validator: validator,
    onSaved: onSaved,
  );
}
