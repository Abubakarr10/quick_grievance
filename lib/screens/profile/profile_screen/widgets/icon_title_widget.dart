
import 'package:flutter/material.dart';

import '../../../../conts/app_colors.dart';
import '../../../../conts/app_height_width.dart';
import '../../../app_widgets/app_text_widget.dart';

class IconTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const IconTitleWidget({
    super.key, required this.title, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 05),
      child: ListTile(
        onTap: onTap,
        title: AppTextWidget(
          title: title,
          fontSize: heightX*.018,
          fontWeight: FontWeight.w500,
          textColor: pureBlack,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: secondaryColor,
          size: heightX*.025,
        ),
      ),
    );
  }
}