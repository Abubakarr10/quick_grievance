
import 'package:flutter/material.dart';

import '../../../../conts/app_colors.dart';
import '../../../../conts/app_height_width.dart';
import '../../../app_widgets/widgets.dart';

class DuelText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final VoidCallback onTap;
  const DuelText({
    super.key, required this.firstText, required this.secondText, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextWidget(title: firstText,
            textColor: accentColor, fontWeight: FontWeight.w500,
            fontSize: heightX*.016,
          ),
          AppTextWidget(title: secondText,
            textColor: accentColor, fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            fontSize: heightX*.016,
          ),
        ],
      ),
    );
  }
}