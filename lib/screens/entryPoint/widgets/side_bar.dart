import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import 'package:quick_grievance/screens/entryPoint/EntryPointController.dart';

import '../../../model/menu_model.dart';
import '../../../repository/share_preferences/sp_controller.dart';
import '../../../utils/rive_utils.dart';
import 'info_card.dart';
import 'side_menu.dart';

//
// class SideBar extends StatefulWidget {
//   const SideBar({super.key});
//
//   @override
//   State<SideBar> createState() => _SideBarState();
// }
//
// class _SideBarState extends State<SideBar> {
//   Menu selectedSideMenu = sidebarMenus.first;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         width: 288,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           color: secondaryColor,
//           borderRadius: BorderRadius.all(
//             Radius.circular(30),
//           ),
//         ),
//         child: DefaultTextStyle(
//           style: const TextStyle(color: Colors.white),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               // Top Name: Hostel Student Name
//               const InfoCard(
//                 name: 'Hiba Gee',
//                 bio: "BS Software Engineering",
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
//                 child: AppTextWidget(title: "Browse".toUpperCase(),
//                 color: primaryColor, fontSize: 18, fontWeight: FontWeight.w700,
//                 ),
//               ),
//               ...sidebarMenus.map((menu) => SideMenu(
//                     menu: menu,
//                     selectedMenu: selectedSideMenu,
//                     press: () {
//                       RiveUtils.changeSMIBoolState(menu.rive.status!);
//                       setState(() {
//                         selectedSideMenu = menu;
//                       });
//                     },
//                     riveOnInit: (artBoard) {
//                       menu.rive.status = RiveUtils.getRiveInput(artBoard,
//                           stateMachineName: menu.rive.stateMachineName);
//                     },
//                   )),
//               Padding(
//                 padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
//                 child: AppTextWidget(title: "History".toUpperCase(),
//                   color: primaryColor, fontSize: 18, fontWeight: FontWeight.w700,
//                 ),
//               ),
//               ...sidebarMenus2.map((menu) => SideMenu(
//                     menu: menu,
//                     selectedMenu: selectedSideMenu,
//                     press: () {
//                       RiveUtils.changeSMIBoolState(menu.rive.status!);
//                       setState(() {
//                         selectedSideMenu = menu;
//                       });
//                     },
//                     riveOnInit: (artBoard) {
//                       menu.rive.status = RiveUtils.getRiveInput(artBoard,
//                           stateMachineName: menu.rive.stateMachineName);
//                     },
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class SideBar extends GetView<EntryPointController> {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(currentUserId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text(''); // or SizedBox()
                  }

                  if (snapshot.hasError) {
                    return const Text('Error loading user');
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Text('User not found');
                  }

                  final userData = snapshot.data!.data() as Map<String, dynamic>;
                  final fullName = userData['full_name'] ?? 'User';
                  final regNo = userData['reg_no'] ?? 'User';


                  return Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: InfoCard(
                      name: fullName,
                      bio: regNo,
                    ),
                  );
                },
              ),
              // Top Name: Hostel Student Name


              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: AppTextWidget(title: "Browse".toUpperCase(),
                  color: primaryColor, fontSize: 18, fontWeight: FontWeight.w700,
                ),
              ),
              ...sidebarMenus.map((menu) => 
                  Obx(()=> SideMenu(
                    menu: menu,
                    selectedMenu: controller.selectedSideMenu.value,
                    press: () {
                      if(menu.index == 0){
                        controller.isSideMenuOpen.value = false;
                      }else{
                        controller.isSideMenuOpen.value = true;
                      }
                      RiveUtils.changeSMIBoolState(menu.rive.status!);
                      controller.selectedSideMenu.value = menu;
                      controller.sidePageNo.value = menu.index;
                      if (kDebugMode) {
                        print('Side Menu Page=>> ${controller.sidePageNo.value}');
                      }},
                    riveOnInit: (artBoard) {
                      menu.rive.status = RiveUtils.getRiveInput(artBoard,
                          stateMachineName: menu.rive.stateMachineName);
                    },
                  ))),

              // Second Section of Side Menu Bar
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                child: AppTextWidget(title: "History".toUpperCase(),
                  color: primaryColor, fontSize: 18, fontWeight: FontWeight.w700,
                ),
              ),
              ...sidebarMenus2.map((menu) =>
                  Obx(()=> SideMenu(
                    menu: menu,
                    selectedMenu: controller.selectedSideMenu.value,
                    press: () {
                      if(menu.index == 0){
                        controller.isSideMenuOpen.value = false;
                      }else{
                        controller.isSideMenuOpen.value = true;
                      }
                      RiveUtils.changeSMIBoolState(menu.rive.status!);
                      controller.selectedSideMenu.value = menu;
                      controller.sidePageNo.value = menu.index;

                    },
                    riveOnInit: (artBoard) {
                      menu.rive.status = RiveUtils.getRiveInput(artBoard,
                          stateMachineName: menu.rive.stateMachineName);
                    },
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}

