import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import '../../../conts/app_height_width.dart';
import '../admin_dashboard/AdminController.dart';


class AdminComplaintScreen extends StatelessWidget {
  const AdminComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminController>();

    return Obx(() => ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: controller.complaints.length,
      itemBuilder: (context, index) {
        final complaint = controller.complaints[index];
        return Card(
          elevation: 5,
          shadowColor: secondaryColor,
          color: pureWhite,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.report_problem, color: Colors.red),
            title: AppTextWidget(title: complaint, fontSize: heightX*.018,fontWeight: FontWeight.w600,),
            subtitle:  AppTextWidget(title: "Category: Maintenance",fontWeight: FontWeight.w400,
              fontSize: heightX*.014,),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        );
      },
    ));
  }
}
