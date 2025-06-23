import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import '../admin_dashboard/AdminController.dart';

class AdminSlipScreen extends StatelessWidget {
  const AdminSlipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminController>();

    return Obx(() => ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: controller.slips.length,
      itemBuilder: (context, index) {
        final slip = controller.slips[index];
        return Card(
          elevation: 5,
          color: pureWhite,
          shadowColor: secondaryColor,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.note_alt, color: secondaryColor),
            title: AppTextWidget(title: slip, fontSize: heightX*.018,fontWeight: FontWeight.w600,),
            subtitle: AppTextWidget(title: 'Requested for 2 days leave', fontWeight: FontWeight.w400,
            fontSize: heightX*.014,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: const Icon(Icons.check, color: Colors.blue), onPressed: () {}),
                IconButton(icon: const Icon(Icons.close, color: Colors.red), onPressed: () {}),
              ],
            ),
          ),
        );
      },
    ));
  }
}
