import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import '../admin_widgets/widgets.dart';
import 'AdminController.dart';

class DashboardScreen extends GetView<AdminController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminController());

    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth > 900
            ? constraints.maxWidth / 3 - 24
            : constraints.maxWidth / 1.1;

        return Obx(() => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Wrap(
                spacing: 24,
                runSpacing: 24,
                children: [
                  DashboardCardWidget(title: 'Pending Slips', value: controller.slips.length.toString(), icon: Icons.receipt, color: secondaryColor, width: width),
                  DashboardCardWidget(title: 'Complaints', value: controller.complaints.length.toString(), icon: Icons.report, color: Colors.red, width: width),
                  DashboardCardWidget(title: 'Today’s Menu', value: controller.todaysMenu.value, icon: Icons.restaurant, color: Colors.purple, width: width),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
