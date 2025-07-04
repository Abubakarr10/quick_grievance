import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/screens/admin/setting/SettingController.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: heightX*.01,
        children: [

          SizedBox(height: heightX*.01,),

          Card(
            elevation: 5,
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: AppTextWidget(title: 'Logout',
              fontSize: heightX*.02,
              ),
              onTap: (){
                controller.logoutAdminAccount();
              },
            ),
          )

        ],
      ),
    );
  }
}
