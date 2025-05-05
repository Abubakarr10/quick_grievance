
import 'package:flutter/material.dart';

import '../../../conts/app_colors.dart';
import '../../../conts/app_height_width.dart';
import '../../app_widgets/widgets.dart';

class TitleTextFieldWidget extends StatelessWidget {
  final String title, fieldText;
  final TextEditingController textEditingController;
  const TitleTextFieldWidget({
    super.key, required this.title, required this.fieldText, required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Text
        AppTextWidget(title: title,
          fontSize: heightX*.014, fontWeight: FontWeight.w500,
        ),

        SizedBox(height: heightX*.005,),

        // Text Field
        AppTextFormFieldWidget(
          ctrl: textEditingController,
          keyType: TextInputType.text,
          mainColor: secondaryColor,
          labelText: fieldText,
        ),
      ],
    );
  }
}