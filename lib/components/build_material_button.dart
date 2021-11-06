import 'package:flutter/material.dart';
import 'build_custom_text.dart';
import '../styles/colors/colors.dart';

Widget buildMaterialButton({
  VoidCallback? onPressed,
  String? text,
}) {
  return MaterialButton(
    elevation: 0,
    highlightElevation: 0,
    height: 40,
    minWidth: double.infinity,
    color: yellow.withOpacity(0.55),
    onPressed: onPressed,
    child: buildCustomText(text: text!),
  );
}
