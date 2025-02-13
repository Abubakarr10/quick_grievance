import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/app_colors.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 2),
      duration: const Duration(milliseconds: 200),
      height: 4,
      width: isActive ? 25 : 0,
      decoration: const BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          )),
    );
  }
}
