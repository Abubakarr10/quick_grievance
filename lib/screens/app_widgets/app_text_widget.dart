import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../conts/app_height_width.dart';

class AppTextWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const AppTextWidget({super.key,
    required this.title,
    this.fontSize = 14,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
      ),);
  }
}
