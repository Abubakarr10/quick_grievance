import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';
import '../../conts/images/app_images.dart';
import '../../conts/routes/screen_names.dart';
import '../app_widgets/widgets.dart';

class NotificationScreen extends StatelessWidget {
  final bool backoff;
  const NotificationScreen({super.key, required this.backoff});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Visibility(
        visible: backoff == true ? false : true,
        child: FloatingActionButton(
          onPressed: (){
            Get.offNamed(entryPointScreen);
          },
          backgroundColor: accentColor,
          mini: true,
          child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
        ),
      ),
      body: Column(
        children: [

          /// Text => History
          Stack(
            children: [

              Image.asset(appBarVector),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                  child: AppTextWidget(
                      title: 'Notifications',
                      fontSize: heightX*.03,
                      color: Colors.white,
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
