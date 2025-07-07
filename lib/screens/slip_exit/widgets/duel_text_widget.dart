import 'package:flutter/material.dart';

import '../../../conts/app_height_width.dart';
import '../../app_widgets/widgets.dart';

class DuelTextWidget extends StatelessWidget {
  final String title,value;
  final double fontSize;
  const DuelTextWidget({
    super.key, required this.title, required this.value, this.fontSize = 0.018,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextWidget(title: title,
              fontWeight: FontWeight.w700,
              fontSize: heightX*fontSize,),
            SizedBox(
              width: widthX*.4,
              child: Align(
                alignment: Alignment.centerRight,
                child: AppTextWidget(title: value,
                  textAlign: TextAlign.right,
                  fontWeight: FontWeight.w500,
                  fontSize: heightX*fontSize,),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
