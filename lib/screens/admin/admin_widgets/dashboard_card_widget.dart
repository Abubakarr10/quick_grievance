import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';

class DashboardCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final double width;

  const DashboardCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextWidget(title: title, fontSize: heightX*.020,fontWeight: FontWeight.w600, textColor: color,),
              const SizedBox(height: 6),
              AppTextWidget(title: value, fontSize: heightX*.024,fontWeight: FontWeight.bold, textColor: color,)
            ],
          ),

          Icon(icon, size: heightX*.08, color: color),
        ],
      ),
    );
  }
}
