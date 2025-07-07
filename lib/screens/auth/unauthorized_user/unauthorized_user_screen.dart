import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';
import 'package:quick_grievance/screens/app_widgets/spin_kit_widget.dart%20';
import 'package:quick_grievance/screens/profile/profile_screen/settings/user/UserController.dart';

import '../../../conts/app_height_width.dart';

class UnauthorizedUserScreen extends GetView<UserController> {
  const UnauthorizedUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.logoutAccount();
        },
        backgroundColor: accentColor,
        mini: true,
        child: const Icon(Icons.logout,color: secondaryColor,),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Obx((){
            final user = controller.user.value;
            if (user == null) {
              return const Center(child: SpinKitWidget()); // or splash/loading widget
            }

             return Column(
                spacing: heightX*.005,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon( controller.user.value!.isAuthorized == 'false'?
                  Icons.timer : CupertinoIcons.xmark_circle_fill,
                    color: controller.user.value!.isAuthorized == 'false'? primaryColor : Colors.red,
                    size: heightX*.1,),
                  AppTextWidget(title: controller.user.value!.isAuthorized == 'false'?
                  'Wait'.toUpperCase() : 'rejected'.toUpperCase(),
                    fontWeight: FontWeight.bold,
                    fontSize: heightX*.03,),
                  AppTextWidget(
                    textAlign: TextAlign.center,
                    title: controller.user.value!.isAuthorized == 'false'?
                    'You are unauthorized user until Warden approve your request.'
                        :
                    'You are request is rejected by Warden'
                    ,fontSize: heightX*.016, fontWeight: FontWeight.w600,
                  ),

                  SizedBox(height: heightX*.1,),


                  AppTextWidget(
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400,
                      title: controller.user.value!.isAuthorized == 'false'?
                      'Contact Warden Or Wait for Verification\nTHANk YOU:)'
                          :
                      'Contact Warden Or Create A New Account\nTHANk YOU:)'
                  )

                ],
              );

  }
          ),
        ),
      ),
    );
  }
}
