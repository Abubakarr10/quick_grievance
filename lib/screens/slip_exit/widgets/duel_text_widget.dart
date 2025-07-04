import 'package:flutter/material.dart';

import '../../../conts/app_height_width.dart';
import '../../app_widgets/widgets.dart';

class DuelTextWidget extends StatelessWidget {
  final String title,value;
  const DuelTextWidget({
    super.key, required this.title, required this.value,
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
              fontSize: heightX*.018,),
            SizedBox(
              width: widthX*.4,
              child: Align(
                alignment: Alignment.centerRight,
                child: AppTextWidget(title: value,
                  textAlign: TextAlign.right,
                  fontWeight: FontWeight.w500,
                  fontSize: heightX*.018,),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
