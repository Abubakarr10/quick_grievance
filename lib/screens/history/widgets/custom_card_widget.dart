
import 'package:flutter/material.dart';

import '../../../conts/app_colors.dart';
import '../../../conts/app_height_width.dart';
import '../../app_widgets/app_text_widget.dart';

class CustomCardWidget extends StatelessWidget {
  final String title,subtitle;
  final Widget leading;
  final VoidCallback onTap;
  const CustomCardWidget({
    super.key, required this.title, required this.subtitle, required this.leading, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: secondaryColor,
      color: secondaryColor,
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListTile(
          onTap: onTap,
          leading: leading,
          title: AppTextWidget(title: title, color: primaryColor,
            fontSize: heightX*.026, fontWeight: FontWeight.bold,
          ),
          subtitle: AppTextWidget(title: subtitle,color: pureWhite,),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
        ),
      ),
    );
  }
}