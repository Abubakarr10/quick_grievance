import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../conts/app_colors.dart';

class SpinKitLoadingWidget extends StatelessWidget {
  final Color color;
  final double size;
  const SpinKitLoadingWidget({
    super.key, this.color = secondaryColor,
    this.size = 25,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color,
      size: size,
    );
  }
}