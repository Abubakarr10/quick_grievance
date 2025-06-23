import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';

import '../../../conts/app_height_width.dart';

class WardenJoinScreen extends StatelessWidget {
  const WardenJoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.offNamed(onBoardingScreen);
          },
        backgroundColor: accentColor,
        mini: true,
        child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(wardenBg),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  )),
            ),
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        primaryColor.withAlpha(450),
                        secondaryColor,
                      ],
                      begin: FractionalOffset.topLeft,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: heightX*.8,
                margin: const EdgeInsets.only(top: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    Container(
                      height: heightX *.75,
                      width: widthX,
                      margin: EdgeInsets.symmetric(
                        horizontal: widthX * .1, vertical: 60,
                      ),
                      decoration: BoxDecoration(
                          color: secondaryColor.withAlpha(440),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          InkWell(
                            onTap: (){
                              if (kDebugMode) {
                                print('======== Click hora hai Gee =====');
                              }
                              Get.offAllNamed(adminScreen);
                            },
                            child: const Icon(Icons.work_outline,
                            color: Colors.white,
                              size: 60,
                            ),
                          ),
                          
                          ActionButtonWidget(label: 'Login',
                              onTap: (){
                                Get.offAllNamed(adminScreen);
                              })

                        ],
                      ),
                    ),

                    Positioned(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: heightX*.012),
                            child: CircleAvatar(
                              radius: heightX*.06,
                              backgroundColor: secondaryColor,
                              child: CircleAvatar(
                                radius: heightX*.055,
                                backgroundColor: primaryColor,
                                foregroundImage: const AssetImage(wardenIcon),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
