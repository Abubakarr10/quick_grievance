import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import 'package:quick_grievance/screens/profile/profile_screen/ProfileController.dart';
import 'package:quick_grievance/screens/profile/profile_screen/widgets/widgets.dart';
import '../../../conts/app_height_width.dart';
import '../../../conts/images/app_images.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      body: Column(
        children: [

          /// Text => Slip Exit
          Stack(
            children: [

              Image.asset(appBarVector),

              // Screen Title => Slip Exit
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                  child: AppTextWidget(
                      title: 'Profile',
                      fontSize: heightX*.03,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),


          const IconTextWidget(
            icon: Icons.person_2_outlined,
            title: 'Account',
          ),

          IconTitleWidget(title: 'User account', onTap: () {
            Get.toNamed(userAccountScreen);
          },),
          IconTitleWidget(title: 'Edit User account', onTap: () {
            Get.toNamed(editUserAccountScreen);
          },),


          const IconTextWidget(
            icon: Icons.light_mode_outlined,
            title: 'Themes',
          ),

          IconTitleWidget(title: 'Light mode', onTap: () {
            Get.toNamed(themeScreen);
          },),

          Padding(
            padding: EdgeInsets.only(top: heightX*.04),
            child: ActionButtonWidget(
                width: widthX*.4,
                label: 'Logout',
                onTap: (){
                  controller.logoutAccount();
                }),
          )

        ],
      ),
    );
  }
}



