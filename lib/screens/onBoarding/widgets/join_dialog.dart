import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';

import '../../app_widgets/widgets.dart';
import 'login_form.dart';

void showJoinDialog(BuildContext context, {required ValueChanged onValue}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withAlpha(128),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 550,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(76),
                offset: const Offset(0, 30),
                blurRadius: 60,
              ),
              const BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 30),
                blurRadius: 60,
              ),
            ],
          ),
          child: Scaffold(
             backgroundColor: primaryColor,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [

                      SizedBox(height: heightX*.02,),

                      // Text: Login
                      AppTextWidget(title: 'Join Hostel',
                        fontSize: heightX*.036,
                        textColor: secondaryColor,
                        fontWeight: FontWeight.w700,),

                      // Text: description
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: AppTextWidget(
                          title: "Easily manage hostel affairs. Log in as a Hostelite or Warden to submit complaints, approve requests, and stay updated",
                          textAlign: TextAlign.center,
                          textColor: Colors.white,
                          showShadows: true,
                        ),
                      ),


                      const SizedBox(height: 30,),

                      IconImageTextWidget(
                        iconImage: hosteliteIcon, label: 'Join as Hostelite',
                        onTap: () {
                        Get.toNamed(loginScreen);
                        },),

                      const DividerTextWidget(),

                      IconImageTextWidget(
                        iconImage: wardenIcon, label: 'Join as Warden',
                        onTap: () {
                          Get.toNamed(wardenScreen);
                        },),

                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: (){
                      //Get.offNamed(onBoardingScreen);
                      Get.back();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },

    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      // if (anim.status == AnimationStatus.reverse) {
      //   tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      // } else {
      //   tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      // }

      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: anim, curve: Curves.easeInOut),
        ),
        // child: FadeTransition(
        //   opacity: anim,
        //   child: child,
        // ),
        child: child,
      );
    },
  ).then(onValue);
}

