import 'package:flutter/material.dart';

import '../../../../conts/app_colors.dart';
import '../../../app_widgets/widgets.dart';

class IconTextWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const IconTextWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30, right: 30),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              AppTextWidget(
                  title: title, fontSize: 20, fontWeight: FontWeight.w700)
            ],
          ),
          const Divider(
            thickness: 1, color: secondaryColor,
          )
        ],
      ),
    );
  }
}
