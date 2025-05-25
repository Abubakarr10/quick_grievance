// 🔧 Dart Code: GradientTextWidget
import 'package:flutter/material.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';

import '../../conts/app_height_width.dart';

class GradientTextWidget extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final TextAlign textAlign;

  const GradientTextWidget({
    super.key,
    required this.text,
    required this.gradient,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient
            .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
      },
      child: AppTextWidget(title: 'Salam! Abubakar',
        textColor: Colors.white,
        fontSize: heightX*.024, fontWeight: FontWeight.bold,
      ),
    );
  }
}
