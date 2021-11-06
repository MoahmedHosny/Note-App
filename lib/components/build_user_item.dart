import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'build_custom_text.dart';

Widget buildUserItem({
  required String text,
  required IconData icon,
}) {
  return Row(
    children: [
      Icon(
        icon,
        size: 18,
      ),
      const SizedBox(width: 10),
      Expanded(
        child: buildCustomText(
          text: text,
          fontSize: 15,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
