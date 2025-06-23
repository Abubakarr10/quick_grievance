import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/screens/admin/admin_dashboard/dashboard_screen.dart';
import 'package:quick_grievance/screens/admin/complaint/admin_complaint_screen.dart';
import 'package:quick_grievance/screens/admin/mess/admin_mess_screen.dart';
import 'package:quick_grievance/screens/admin/slip_exit/admin_slip_screen.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';

import '../../../conts/app_colors.dart';
import 'AdminController.dart';


class AdminScreen extends GetView<AdminController> {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminController());

      return Scaffold(
       // backgroundColor: primaryColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: pureWhite),
          backgroundColor: secondaryColor,
          title: Obx(() => AppTextWidget(title: controller.navTitles[controller.selectedIndex.value],
          textColor: pureWhite, fontSize: heightX*.022, fontWeight: FontWeight.w700,
          )),
          //TODO: Set Theme
          // actions: [
          //   Obx(() => IconButton(
          //     icon: Icon(controller.isDarkMode.value ? Icons.dark_mode : Icons.light_mode),
          //     onPressed: controller.toggleTheme,
          //   )),
          //],
        ),
        drawer: Drawer(
          backgroundColor: secondaryColor,
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: secondaryColor
                ),
                accountName: AppTextWidget(title: 'Warden',textColor: pureWhite,),
                accountEmail: AppTextWidget(title: 'admin@hostel.com', textColor: pureWhite,),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: primaryColor,
                    child: Icon(Icons.person,size: 50,color: secondaryColor,)),
              ),
              ...List.generate(controller.navTitles.length, (index) {
                return Obx(() => ListTile(
                  selected: controller.selectedIndex.value == index,
                  selectedColor: accentColor,
                  iconColor: midTextColor,
                  leading: Icon([
                    Icons.dashboard,
                    Icons.receipt_long,
                    Icons.report_problem,
                    Icons.restaurant_menu
                  ][index]),
                  title: AppTextWidget(title: controller.navTitles[index],
                    textColor: controller.selectedIndex.value == index? accentColor : midTextColor,
                    fontSize: controller.selectedIndex.value == index? heightX*.020 : heightX*.016,
                    fontWeight: controller.selectedIndex.value == index? FontWeight.w700 : FontWeight.w500,
                    ),
                  onTap: () {
                    controller.selectedIndex.value = index;
                    Get.back();
                  },
                ));
              }),
            ],
          ),
        ),
        body: Obx(() => IndexedStack(
          index: controller.selectedIndex.value,
          children: const [
            DashboardScreen(),
            AdminSlipScreen(),
            AdminComplaintScreen(),
            AdminMessScreen(),
          ],
        )),
      );
  }
}
