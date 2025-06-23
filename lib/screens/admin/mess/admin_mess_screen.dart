import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';
import '../admin_dashboard/AdminController.dart';

class AdminMessScreen extends GetView<AdminController> {
  const AdminMessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminController());

    return Obx(() => Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextWidget(title: 'Today\'s Menu', fontSize: heightX*.026, fontWeight: FontWeight.bold,),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              border: Border.all(color: Colors.purple),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.restaurant_menu, size: 32, color: Colors.purple),
                const SizedBox(width: 12),
                Expanded(
                  child: AppTextWidget(title: controller.todaysMenu.value, fontSize: heightX*.020,),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
