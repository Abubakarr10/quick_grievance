import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/auth_service.dart';

class ProfileController extends GetxController{

  final authService = AuthService();
  late SharedPreferences prefs;


  void logoutAccount(){
    authService.logout();
    Get.offAllNamed(onBoardingScreen);
  }

}