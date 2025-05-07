import 'package:flutter/material.dart';

import '../../../../../../conts/app_colors.dart';
import '../../../../../../conts/app_height_width.dart';
import '../../../../../app_widgets/widgets.dart';

class InfoRowWidget extends StatelessWidget {
  final String title;
  final String info;
  final IconData icon;
  const InfoRowWidget({
    super.key, required this.title, required this.icon, required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: secondaryColor,size: heightX*.028,),
            const SizedBox(width: 8),
            AppTextWidget(title: title,fontSize: heightX*.018,
            fontWeight: FontWeight.bold, textColor: secondaryColor,
            ),
          ],
        ),

        AppTextWidget(title: info,fontSize: heightX*.018,)
      ],
    );
  }
}
