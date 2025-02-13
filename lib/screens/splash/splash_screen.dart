import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/screens/splash/SplashController.dart';

import '../../conts/app_height_width.dart';


class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  height: heightX*.2,
                  width: heightX*.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(color: primaryColor,blurRadius: 20,offset: Offset(0, -10)),
                        BoxShadow(color: accentColor,blurRadius: 20,offset: Offset(0, 10)),
                      ],
                      image: const DecorationImage(image: AssetImage(appLogoImage),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high
                      )
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
