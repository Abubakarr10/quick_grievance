// ignore_for_file: file_names
import 'dart:async';

import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';

import '../../repository/share_preferences/sp_controller.dart';


class SplashController extends GetxController{

  @override
  void onInit() async{
    super.onInit();
    bool isLoggedIn = await getLoginStatus();
    bool isWardenLoggedIn = await getWardenLoginStatus();
    Timer(const Duration(seconds: 3), () {
      if(isLoggedIn == true){
        Get.offNamed(entryPointScreen);
      }else if(isWardenLoggedIn == true){
        Get.offNamed(adminScreen);
      }else{
       Get.offNamed(onBoardingScreen);
      }
    });
  }

}