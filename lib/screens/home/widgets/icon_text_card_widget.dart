import 'package:flutter/material.dart';

import '../../../conts/app_colors.dart';
import '../../../conts/app_height_width.dart';
import '../../app_widgets/widgets.dart';

class IconTextCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color bgColor;
  final Color contentColor;
  const IconTextCardWidget({
    super.key,
    required this.title, required this.subtitle, required this.icon,
    this.bgColor = secondaryColor,
    this.contentColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthX,
      height: heightX*.14,
      margin: EdgeInsets.symmetric(vertical: heightX*.015,horizontal: 20),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10, offset: Offset(0, heightX*.01),
            )]
      ),
      child: Padding(
        padding:  EdgeInsets.all(heightX*.014),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(title: title.toUpperCase(),
                  fontWeight: FontWeight.bold, textColor: contentColor,
                  fontSize: fontSizeX*.024,
                ),
                AppTextWidget(title: subtitle.toUpperCase(),
                  fontWeight: FontWeight.bold, textColor: contentColor,
                  fontSize: fontSizeX*.018,
                ),
              ],
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Icon(icon,color: contentColor,
                size: heightX*.07,),
            )
          ],
        ),
      ),
    );
  }
}
