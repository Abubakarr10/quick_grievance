import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../conts/routes/screen_names.dart';
import '../../../repository/auth_service.dart';
import '../../../repository/share_preferences/sp_controller.dart';

class LogoutController extends GetxController{

  final authService = AuthService();
  late SharedPreferences prefs;


  Future<void> logoutAccount()async{
    await authService.logout();
    await saveLoginStatus(false);
    Get.offAllNamed(onBoardingScreen);
  }

}