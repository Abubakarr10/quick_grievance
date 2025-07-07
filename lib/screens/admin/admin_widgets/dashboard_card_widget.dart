import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';

class DashboardCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final double width;
  final VoidCallback onTap;

  const DashboardCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.width, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withAlpha(50),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withAlpha(100)),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(title: title, fontSize: heightX*.020,fontWeight: FontWeight.w600, color: color,),
                const SizedBox(height: 6),
                SizedBox(
                    width: widthX*.5,
                    child: AppTextWidget(title: value, fontSize: heightX*.028,fontWeight: FontWeight.bold, color: color,))
              ],
            ),

            Icon(icon, size: heightX*.08, color: color),
          ],
        ),
      ),
    );
  }
}
