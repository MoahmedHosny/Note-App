import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void buildSnackBar({
  required String title,
  required String msg,
}) {
  Get.snackbar(
    title,
    msg,
    messageText: Text(
      msg,
      style: GoogleFonts.merriweatherSans(
        fontWeight: FontWeight.bold,
      ),
    ),
    titleText: Text(
      title,
      style: GoogleFonts.merriweatherSans(
        fontWeight: FontWeight.bold,
      ),
    ),
    borderRadius: 4,
    duration: const Duration(seconds: 4),
  );
}
