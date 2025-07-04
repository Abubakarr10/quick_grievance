import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/auth_service.dart';
import '../../../repository/share_preferences/sp_controller.dart';

class SettingController extends GetxController {

  final authService = AuthService();
  late SharedPreferences prefs;

  Future<void> logoutAdminAccount()async{
    await authService.logout();
    await saveWardenLoginStatus(false);
    Get.offAllNamed(initialScreen);
  }

}