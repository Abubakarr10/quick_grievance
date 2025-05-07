import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../conts/app_colors.dart';
import '../../../../../conts/app_height_width.dart';
import '../../../../../conts/images/app_images.dart';
import '../../../../../conts/routes/screen_names.dart';
import '../../../../app_widgets/widgets.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.offNamed(profileScreen);
        },
        backgroundColor: accentColor,
        mini: true,
        child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
      ),
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
                      title: 'Themes',
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
