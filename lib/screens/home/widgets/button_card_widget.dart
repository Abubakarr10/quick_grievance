
import 'package:flutter/material.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';

import '../../../conts/app_colors.dart';
import '../../../conts/app_height_width.dart';

class CardButtonWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const CardButtonWidget({
    super.key, required this.label, required this.icon, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: heightX*.18,
          width: widthX*.4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [primaryColor,accentColor]),
            border: Border.all(
                color: borderColor,
                width: 5
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              // Icon
              CircleAvatar(
                radius: 40,
                backgroundColor: secondaryColor,
                child: Icon(icon,
                  color: Colors.white,size: 40,),
              ),
              // Text: Label
              AppTextWidget(title: label,
                fontSize: heightX*.022,
                fontWeight: FontWeight.w600, color: secondaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}