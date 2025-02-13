import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../conts/app_height_width.dart';

class AppTextWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool showShadows;
  final TextDecoration decoration;

  const AppTextWidget({super.key,
    required this.title,
    this.fontSize = 14,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start,
    this.showShadows = false,
    this.decoration = TextDecoration.none
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        decoration: decoration,
        decorationColor: textColor,
        fontWeight: fontWeight,
        color: textColor,
        shadows: showShadows == true? [
          const BoxShadow(
            color: Colors.black, blurRadius: 100
          )
        ] : null
      ),);
  }
}
