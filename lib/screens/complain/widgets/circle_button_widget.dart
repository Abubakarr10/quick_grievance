import 'package:flutter/material.dart';

import '../../../conts/app_colors.dart';
import '../../../conts/app_height_width.dart';
import '../../app_widgets/widgets.dart';

class CircleButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  const CircleButtonWidget({
    super.key, required this.onTap, required this.title, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: secondaryColor,
            radius: heightX*.05,
            child: IconButton(
                onPressed: onTap,
                icon: Icon(icon,
                  color: primaryColor,
                  size: heightX*.07,
                )),
          ),
          SizedBox(height: heightX*.01,),

          AppTextWidget(title: title, textColor: secondaryColor,
            fontSize: heightX*.018, fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}