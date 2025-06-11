import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_grievance/screens/community/CommunityController.dart';
import 'package:quick_grievance/screens/community/widgets/widgets.dart';
import 'package:quick_grievance/screens/complain/ComplainController.dart';
import 'package:quick_grievance/screens/complain/widgets/widgets.dart';
import 'package:quick_grievance/screens/profile/profile_screen/ProfileController.dart';

import '../../../conts/app_height_width.dart';
import '../../../conts/images/app_images.dart';

import '../../conts/app_colors.dart';
import '../../conts/routes/screen_names.dart';
import '../../conts/validator/validator.dart';
import '../../model/slip_exit_model.dart';
import '../app_widgets/widgets.dart';
import '../auth/hostelite/signup/widgets/drop_down_button_ff_widget.dart';
import '../slip_exit/widgets/widgets.dart';

class CommunityScreen extends GetView<CommunityController> {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CommunityController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: (){
              Get.offNamed(entryPointScreen);
            },
            backgroundColor: accentColor,
            mini: true,
            child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: FloatingActionButton(
              onPressed: (){
                Get.offNamed(addPostScreen);
              },
              backgroundColor: primaryColor,
              mini: true,
              child: const Icon(Icons.post_add,color: secondaryColor,),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [

          Stack(
            children: [


              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,),
                  child: Column(
                    children: [

                      SizedBox(height: heightX*.2,),

                      PostWidget(controller: controller),
                      PostWidget(controller: controller),

                      SizedBox(height: heightX*.1,),

                    ],
                  ),
                ),
              ),

              // Top AppBar bg vector
              Image.asset(appBarVector),

              // Screen Title => Community
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthX*.04),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                        child: AppTextWidget(
                            title: 'Community',
                            fontSize: heightX*.03,
                            textColor: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),


                  ],
                ),
              ),

            ],
          ),

          const SizedBox(height: 30,),

        ],
      ),
    );
  }
}



