import 'package:flutter/material.dart';

import '../../conts/app_colors.dart';

class DividerTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  const DividerTextWidget({
    super.key, this.text = 'OR', this.color = secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        children: [
          Expanded(
            child: Divider(color: color,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(child: Divider(color: color,)),
        ],
      ),
    );
  }
}
