import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';

import '../../conts/app_colors.dart';

class IconImageTextWidget extends StatelessWidget {
  final String iconImage;
  final String label;
  final Color backgroundColor;
  final Color contentColor;
  final VoidCallback onTap;
  final double height;
  final double width;
  final double fontSize;

  const IconImageTextWidget({
    super.key,
    required this.iconImage,
    required this.label,
    this.backgroundColor = secondaryColor,
    this.contentColor = accentColor, required this.onTap,
    this.height = 80,
    this.width = 300,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
          boxShadow: const [BoxShadow(
            color: Colors.black,
            blurRadius: 10, offset: Offset(0, 10),
          )]
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(iconImage,color: contentColor,),
            AppTextWidget(title: label,
              color: contentColor, fontSize: fontSize, fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}