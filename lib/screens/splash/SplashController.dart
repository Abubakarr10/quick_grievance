// ignore_for_file: file_names
import 'dart:async';

import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';


class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(onBoardingScreen);
    });
  }

}