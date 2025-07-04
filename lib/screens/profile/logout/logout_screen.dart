import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import 'LogoutController.dart';

class LogoutScreen extends GetView<LogoutController> {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogoutController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

          SizedBox(height: heightX*.1,),

          Center(
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                ),
                child: Image.asset(logoutGif,
                fit: BoxFit.cover,
                )),
          ),

          ActionButtonWidget(label: 'Yes',
              onTap: (){
            controller.logoutAccount();
              }),
          SizedBox(height: heightX*.03,),

          InkWell(
            onTap: (){
              Get.offNamed(entryPointScreen);
            },
            child: Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                color: pureWhite,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: secondaryColor),
                boxShadow: const [
                  BoxShadow(
                    color: secondaryColor,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ]
              ),
              child: Center(
                child: AppTextWidget(title: 'No',
                  fontSize: fontSizeX*.018,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
