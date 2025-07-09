// ignore_for_file: file_names
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/profile/profile_screen/settings/user/UserController.dart';

import '../../repository/share_preferences/sp_controller.dart';


class SplashController extends GetxController {
  final UserController controller = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    initApp();
  }

  Future<void> initApp() async {
    final isLoggedIn = await getLoginStatus();
    final isWardenLoggedIn = await getWardenLoginStatus();

    await Future.delayed(const Duration(seconds: 3));

    if (isLoggedIn) {
      await controller.loadUserData(); // ensure user data is loaded
      final user = controller.user.value;

      if (user != null) {
        final authStatus = user.isAuthorized.toString();
        if (kDebugMode) print('🟢 User Loaded: ${user.isAuthorized}');

        if (authStatus == 'true') {
          Get.offNamed(entryPointScreen);
        } else {
          Get.offNamed(unauthorizedScreen);
        }
      } else {
        if (kDebugMode) print('🔴 User is null after loadUserData');
        Get.offNamed(unauthorizedScreen);
      }
    } else if (isWardenLoggedIn) {
      Get.offNamed(adminScreen);
    } else {
      Get.offNamed(onBoardingScreen);
    }
  }


}