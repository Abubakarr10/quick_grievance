import 'package:flutter/material.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';

class ActionButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double height;
  final double width;
  const ActionButtonWidget({
    super.key, required this.label, required this.onTap,
    this.height = 40,
    this.width = 300,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: accentColor,
            boxShadow: [BoxShadow(
              color: secondaryColor,
              blurRadius: 10, offset: Offset(0, heightX*.01),
            )],
        ),
        child: AppTextWidget(title: label,
          fontSize: fontSizeX*.018,
          fontWeight: FontWeight.bold,
          textColor: Colors.black,),
      ),
    );
  }
}
