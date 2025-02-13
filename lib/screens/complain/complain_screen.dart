import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/screens/profile/profile_screen/ProfileController.dart';

import '../../../conts/app_height_width.dart';
import '../../../conts/images/app_images.dart';

import '../app_widgets/widgets.dart';

class ComplainScreen extends StatelessWidget {
  const ComplainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      body: Column(
        children: [

          /// Text => Complain
          Stack(
            children: [

              Image.asset(appBarVector),

              // Screen Title => Slip Exit
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                  child: AppTextWidget(
                      title: 'Complain',
                      fontSize: heightX*.03,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}


